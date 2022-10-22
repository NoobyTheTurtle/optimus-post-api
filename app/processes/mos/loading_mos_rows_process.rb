require 'zip'

class Mos::LoadingMosRowsProcess
  class << self
    def call(dataset_id)
      result = MosAdapter.get_id_for_json(dataset_id: dataset_id)
      return unless result[:success]

      id = result[:response].find { |item| item['Format'] == 'json' }['EhdId']
      return unless id

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
            path = "#{directory_name}/#{dataset_id.to_s + (index == 0 ? "" : "_#{index}")}.json"
            @json_paths << path
            zip_file.extract(file, path)
          end
        end

        @json_paths.each do |path|
          next unless File.exist?(path)

          file = File.open(path, encoding: 'CP1251')
          data = JSON.load(file)
          data.each do |row|
            Mos::Row.find_or_create_by(
              global_id: row['global_id'],
              geo_data: row['geoData'],
              email: row['Email'][0]['Email'],
              public_phone: row['PublicPhone'][0]['PublicPhone'],
              common_name: row['CommonName'],
              mos_dataset_id: dataset_id
            )
          end
        end
      ensure
        File.delete(@zip_path) if @zip_path && File.exist?(@zip_path)
        (@json_paths || []).each do |path|
          File.delete(path) if File.exist?(path)
        end
      end
    end
  end
end
