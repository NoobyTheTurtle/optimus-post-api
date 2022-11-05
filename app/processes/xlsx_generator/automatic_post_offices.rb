# frozen_string_literal: true
module XlsxGenerator
  class AutomaticPostOffices
    require 'axlsx'

    class << self
      def call(list:, filename:)
        lang_path = :automatic_post_office
        Axlsx::Package.new do |p|
          p.workbook.add_worksheet(name: I18n.t('automatic_post_offices', scope: lang_path)) do |sheet|
            fields = %i[
              id district area address is_placed placement_object_type people_in_range distance_to_metro
              distance_to_bus predict_a predict_b predict_c
            ].map { |e| I18n.t(e, scope: lang_path) }
            sheet.add_row fields

            list.each do |resource|
              sheet.add_row(
                [
                  resource.id,
                  resource.district&.short_name,
                  resource.area&.name,
                  resource.address,
                  I18n.t(resource.is_placed, scope: lang_path),
                  resource.placement_object_type&.name,
                  resource.people_in_range,
                  resource.distance_to_metro,
                  resource.distance_to_bus,
                  resource.predict_a,
                  resource.predict_b,
                  resource.predict_c
                ]
              )
            end
          end
          p.serialize(filename)
        end
      end
    end
  end
end
