class Mos::Dataset < Mos::Model
  has_many :mos_rows, class_name: 'Mos::Row', foreign_key: :mos_dataset_id

  def json_data
    path = "#{Rails.root}/tmp/mos_datasets/#{id}.json"
    return unless File.exist?(path)

    JSON.parse(File.open(path, encoding: Mos::ENCODING))
  end
end
