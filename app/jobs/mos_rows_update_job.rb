class MosRowsUpdateJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform
    failed = []
    successful = []
    info = []

    Mos::Dataset.where(id: Mos::Dataset::FULL_DATASET_IDS).find_each do |dataset|
      Mos::RowsUpdateProcess.call_via_api(dataset.id) ? (successful << dataset.id) : (failed << dataset.id)
    end

    Mos::Dataset.where.not(id: Mos::Dataset::FULL_DATASET_IDS).find_each do |dataset|
      if Mos::RowsUpdateProcess.call_via_api(dataset.id) || Mos::RowsUpdateProcess.call_via_json(dataset.id)
        successful << dataset.id
      else
        failed << dataset.id
        info << "Not json file, dataset_id: #{dataset.id}"
      end
    rescue StandardError => e
      info << "dataset_id: #{dataset.id} \n ERROR: #{e&.to_s}"
      failed << dataset.id
    end
    VacuumCleanerStatus.create(successful:, failed:, info:)
  end
end
