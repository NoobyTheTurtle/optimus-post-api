require 'zip'

module Mos
  class MosRowsUpdateProcess
    class << self
      def call_via_json(dataset_id)
        result = MosAdapter.get_id_for_json(dataset_id:)
        return unless result[:success] && result[:response]

        id = result[:response].find { |item| item['Format'] == 'json' }&.[]('EhdId')
        return false unless id

        directory_name = "#{Rails.root}/tmp/mos_datasets"
        Dir.mkdir(directory_name) unless File.exist?(directory_name)
        result = MosAdapter.get_dataset_row(json_id: id)
        return unless result[:success]

        begin
          @json_paths = []
          @zip_path = "#{directory_name}/#{dataset_id}.zip"
          File.open(@zip_path, 'wb') { |fp| fp.write(result[:response]) }
          Zip::File.open(@zip_path) do |zip_file|
            zip_file.each_with_index do |file, index|
              path = "#{directory_name}/#{dataset_id.to_s + (index.zero? ? '' : "_#{index}")}.json"
              @json_paths << path
              zip_file.extract(file, path)
            end
          end

          @json_paths.each do |path|
            next unless File.exist?(path)

            file = File.open(path, encoding: Mos::ENCODING)
            data = JSON.parse(file.read)
            data.each do |row|
              create_row(row, dataset_id) if row['geoData']
            end
          end
          true
        ensure
          File.delete(@zip_path) if @zip_path && File.exist?(@zip_path)
          (@json_paths || []).each do |path|
            File.delete(path) if File.exist?(path)
          end
        end
      end

      def call_via_api(dataset_id)
        result = MosAdapter.get_datasets_count(dataset_id:)
        return unless result[:success]

        count = result[:response]
        top = 500
        skip = 0
        loop do
          result = MosAdapter.get_rows(dataset_id:, top:, skip:)
          break unless result[:success]

          (result[:response] || []).each do |row|
            row = row['Cells']
            create_row(row, dataset_id) if row['geoData']
          end
          break if count <= top

          skip += 500
          top += 500
        end
      end

      private

      def create_row(row, dataset_id)
        Mos::Row.find_or_create_by(
          global_id: row['global_id'],
          geo_data: row['geoData'],
          mos_dataset_id: dataset_id
        )
      end
    end
  end
end
