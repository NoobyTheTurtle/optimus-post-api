module Mos
  class RowCreateProcess
    class << self
      def call(row, dataset_id)
        case dataset_id
        when 2781 # Kiosk
          create_full_row(Mos::Kiosk, row, dataset_id)
        when 619 # ShoppingFacility
          create_full_row(Mos::ShoppingFacility, row, dataset_id)
        when 611 # MultifunctionalCenter
          get_deep_value(row, %w[PublicPhone])
          create_full_row(Mos::MultifunctionalCenter, row, dataset_id)
        when 526 # Library
          get_deep_value(row, %w[PublicPhone Email])
          create_full_row(Mos::Library, row, dataset_id)
        when 493 # CultureHouse
          get_deep_value(row, %w[PublicPhone Email])
          create_full_row(Mos::CultureHouse, row, dataset_id)
        when 629 # SportsFacility
          get_deep_value(row, %w[PublicPhone Email ChiefPhone])
          create_full_row(Mos::SportsFacility, row, dataset_id)
        else
          Mos::Row.find_or_initialize_by(global_id: row['global_id'], mos_dataset_id: dataset_id)
                  .update(geo_data: row['geoData'], data: row)
        end
      end

      private

      def create_full_row(table_name, row, dataset_id)
        table_name.find_or_initialize_by(global_id: row['global_id'], mos_dataset_id: dataset_id)
                  .update(attributes_by_row(table_name.column_names, row))
      end

      def attributes_by_row(attributes, row)
        row.each_with_object({}) do |el, hash|
          key = el.first.to_s.underscore
          next if key == 'global_id'

          hash[key] = el.last if attributes.include?(key)
        end
      end

      def get_deep_value(row, keys = [])
        keys.each do |key|
          row[key] = row[key][0]&.[](key)
        end
      end
    end
  end
end
