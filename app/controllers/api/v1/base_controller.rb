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
end
