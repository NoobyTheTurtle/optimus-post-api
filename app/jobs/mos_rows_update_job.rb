class MosRowsUpdateJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 0

  def perform
    failed = []
    successful = []
    failed_text = []
    Mos::Dataset.where(contains_geodata: true).find_each do |dataset|
      result = Mos::MosRowsUpdateProcess.call_via_json(dataset.id)
      case result
      when true
        successful << dataset.id
      when false
        Mos::MosRowsUpdateProcess.call_via_api(dataset.id)
      else
        failed << dataset.id
      end
    rescue StandardError => e
      failed << dataset.id
      failed_text << e.to_s
    end
    VacuumCleanerStatus.create(successful:, failed:, failed_text:)
  end
end
