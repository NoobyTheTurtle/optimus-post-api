class MosDatasetsUpdateJob < ApplicationJob
  queue_as :default
  # sidekiq_options retry: false

  def perform
    result = MosAdapter.get_datasets
    if result[:success]
      result[:response].each do |item|
        Mos::Dataset.find_or_create_by(
          id: item['Id'],
          caption: item['Caption'],
          category_id: item['CategoryId'],
          keywords: item['Keywords'],
          contains_geodata: item['ContainsGeodata'],
          identification_number: item['IdentificationNumber']
        )
      end
    end
  end
end
