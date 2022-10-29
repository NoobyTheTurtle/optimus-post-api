class Mos::FullRow < Mos::Model
  self.abstract_class = true

  belongs_to :mos_dataset, class_name: 'Mos::Dataset'

  def url_request
    "https://apidata.mos.ru/v1/datasets/#{mos_dataset_id}/rows?api_key=#{ENV['API_KEY_MOS_RU']}&$filter=Cells/global_ideq#{global_id}&$top=1"
  end
end
