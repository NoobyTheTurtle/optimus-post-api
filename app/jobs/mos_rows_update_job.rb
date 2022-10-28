class MosRowsUpdateJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform
    failed = []
    successful = []
    info = []
    Mos::Dataset.limit(300).find_each do |dataset|
      result = Mos::MosRowsUpdateProcess.call_via_json(dataset.id)
      if result == true
        successful << dataset.id
      else
        info << "Not json file, dataset_id: #{dataset.id}"
        failed << dataset.id
        Mos::MosRowsUpdateProcess.call_via_api(dataset.id)
      end
    rescue StandardError => e
      failed << dataset.id
      info << "dataset_id: #{dataset.id} \n ERROR: #{e&.to_s}"
    end
    VacuumCleanerStatus.create(successful:, failed:, info:)
  end
end
