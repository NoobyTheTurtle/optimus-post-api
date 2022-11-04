class Api::V1::AutomaticPostOfficesController < Api::V1::BaseController
  include Orderable

  def index
    list = params[:page] ? @collection.page(params[:page]).per(params[:per_page] || 10) : @collection
    render json: list, each_serializer: serializer, meta: meta_attributes(list), adapter: :json, status: :ok
  end

  private

  def meta_attributes(list)
    return {} unless params[:page]

    {
      current_page: list.current_page,
      next_page: list.next_page,
      prev_page: list.prev_page,
      total_pages: list.total_pages,
      total_count: list.total_count
    }
  end

  def collection
    @collection ||= ::AutomaticPostOfficesFilter.call(::AutomaticPostOffice.all, filter_params, ordering_params(order_params))
  end

  def filter_params
    params.permit(:area_id, :district_id, :placement_object_type_id, :is_placed)
  end

  def order_params
    params.permit(:sort)
  end
end
