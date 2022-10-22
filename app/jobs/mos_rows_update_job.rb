class MosRowsUpdateJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform(*args)
    failed = []
    successful = []
    failed_text = []
    Mos::Dataset.where(contains_geodata: true).find_each do |dataset|
      begin
        result = Mos::MosRowsUpdateProcess.call_via_json(dataset.id)
        if result == true
          successful << dataset.id
        elsif result == false
          Mos::MosRowsUpdateProcess.call_via_api(dataset.id)
        else
          failed << dataset.id
          failed_text << result[:data_for_json].to_s
        end
      rescue => e
        failed << dataset.id
        failed_text << e.to_s
      end
    end
    VacuumCleanerStatus.create(successful: successful, failed: failed, failed_text: failed_text)
  end
end
