class Api::V1::AreasController < Api::V1::BaseController

  private

  def collection
    @collection ||= Area.where(district_id: params[:district_id])
  end
end
