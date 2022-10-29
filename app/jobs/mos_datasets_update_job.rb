class MosDatasetsUpdateJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform
    result = MosAdapter.get_datasets
    if result[:success]
      result[:response].each do |data|
        Mos::Dataset.find_or_initialize_by(id: data['Id'])
                    .update(attributes_by_data(Mos::Dataset.column_names, data))
      end
    end
  end

  private

  def attributes_by_data(attributes, data)
    data.each_with_object({}) do |el, hash|
      key = el.first.to_s.underscore
      next if key == 'id'

      hash[key] = el.last if attributes.include?(key)
    end
  end
end
