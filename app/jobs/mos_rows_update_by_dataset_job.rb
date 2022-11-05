class MosRowsUpdateByDatasetJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform(dataset_id)
    return unless Mos::Dataset.exists?(id: dataset_id)

    Mos::RowsUpdateProcess.call_via_api(dataset_id) || Mos::RowsUpdateProcess.call_via_json(dataset_id)
  end
end
