# frozen_string_literal: true

module Api
  module V1
    class AutomaticPostOfficesController < Api::V1::BaseController
      include Orderable

      before_action :collection, only: %i[index export_xlsx]

      def index
        list = params[:page] ? @collection.page(params[:page]).per(params[:per_page] || 10) : @collection
        render json: list, each_serializer: serializer, meta: meta_attributes(list), adapter: :json, status: :ok
      end

      def export_xlsx
        filename = "#{Time.zone.now.strftime('%Y-%m-%d_%H:%M:%S')}_automatic_post_offices.xlsx"

        list = @collection.includes(:placement_object_type, :district)
        if list.count > 0
          file = XlsxGenerator::AutomaticPostOffices.call(list:, filename:)
          send_data(file.to_stream.read, filename:)
          File.delete(filename) if File.exist?(filename)
        else
          raise ActiveRecord::RecordNotFound
        end
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
        @collection ||= ::AutomaticPostOfficesFilter.call(::AutomaticPostOffice.all, filter_params,
                                                          ordering_params(order_params))
      end

      def filter_params
        params.permit(:area_id, :district_id, :placement_object_type_id, :is_placed)
      end

      def order_params
        params.permit(:sort)
      end
    end
  end
end
