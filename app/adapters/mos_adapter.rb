# frozen_string_literal: true

class MosAdapter
  include Singleton

  API_DATA_ENDPOINT = 'https://apidata.mos.ru'
  DATA_ENDPOINT = 'https://data.mos.ru'
  OP_ENDPOINT = 'https://op.mos.ru'

  class << self
    def get_datasets
      send_request(
        url: '/v1/datasets',
        endpoint: API_DATA_ENDPOINT
      )
    end

    def get_id_for_json(dataset_id:)
      send_request(
        url: '/api/datasets/expformats',
        endpoint: DATA_ENDPOINT,
        params: { datasetId: dataset_id }
      )
    end

    def get_json_dataset_row(json_id:)
      send_request(
        url: '/EHDWSREST/catalog/export/get',
        endpoint: OP_ENDPOINT,
        params: { id: json_id }
      )
    end

    def get_rows(dataset_id:, top:, skip:, try: 0)
      params = if top
                 skip.zero? ? { '$top' => top } : { '$top' => top, '$skip' => skip }
               else
                 {}
               end

      result = send_request(
        url: "/v1/datasets/#{dataset_id}/rows",
        endpoint: API_DATA_ENDPOINT,
        params:
      )
      result[:success] ? result : raise(StandardError)
    rescue StandardError
      sleep 2
      get_rows(dataset_id:, top:, skip:, try: try + 1) unless try >= 10
    end

    def get_datasets_count(dataset_id:)
      send_request(
        url: "/v1/datasets/#{dataset_id}/count",
        endpoint: API_DATA_ENDPOINT
      )
    end

    private

    def send_request(url:, endpoint:, params: {})
      connection = Faraday.new(
        url: endpoint,
        params: endpoint == API_DATA_ENDPOINT ? { api_key: ENV['API_KEY_MOS_RU'] } : {},
        headers: { 'Content-Type' => 'application/json' }
      ) do |f|
        f.request :json
        f.response :json
      end

      response = connection.get(url, params)

      if response.status == 200
        { success: true, response: response.body }
      else
        { success: false, response: }
      end
    end
  end
end
