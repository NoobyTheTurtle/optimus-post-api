require 'json_web_token'

class Api::V1::BaseController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :load_resource_class
  before_action :collection, only: :index
  before_action :resource, only: :show

  def index
    render json: @collection, each_serializer: serializer, status: :ok
  end

  def show
    render json: @resource, serializer:, status: :ok, method: :show
  end

  protected

  def serializer
    "#{@resource_name}_serializer".classify&.constantize
  end

  # Validates the token and user and sets the @current_user scope
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end

    load_current_user!
    invalid_authentication unless @current_user
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    render json: { error: 'Invalid Request' }, status: :unauthorized
  end

  private

  def load_resource_class
    @resource_name ||= controller_name.singularize
    @resource_class ||= @resource_name.classify.constantize
  rescue NameError
    @resource_class = nil
  end

  def collection
    @collection ||= @resource_class.try(:all)
  end

  def resource
    @resource ||= @resource_class&.find(params[:id]) if params[:id] && @resource_class
  end

  def render_not_found_response(_exception)
    render json: {}, status: :not_found
  end

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JsonWebToken.decode(token)
  rescue
    nil
  end

  # Sets the @current_user with the user_id from payload
  def load_current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end
end
