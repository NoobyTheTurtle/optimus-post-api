require 'swagger_helper'

RSpec.describe 'Districts API', type: :request do
  path 'districts' do
    get('List districts') do
      response(200, 'Successful') do
        before { create_list(:district, 3) }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.size).to eq(3)
        end
      end
    end
  end
end
