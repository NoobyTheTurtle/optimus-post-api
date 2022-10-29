require 'swagger_helper'

RSpec.describe 'Areas API', type: :request do

  path '/areas/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show area') do
      response(200, 'Successful') do
        let(:id) { create(:area).id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do
          area = JSON.parse(response.body)
          expect(area['id']).to eq(id)
        end
      end

      response(404, 'Not found') do
        let(:id) { 0 }
        run_test!
      end
    end
  end
end
