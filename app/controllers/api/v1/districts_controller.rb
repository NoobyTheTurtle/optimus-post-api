class Api::V1::DistrictsController < Api::V1::BaseController
  def index
    render json: @collection.includes(:areas), each_serializer: serializer, status: :ok
  end
end
