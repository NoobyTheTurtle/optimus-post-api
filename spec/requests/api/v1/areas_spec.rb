require 'swagger_helper'

RSpec.describe 'Areas API', type: :request do

  path '/areas/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show area by id') do
      tags 'Areas'
      produces 'application/json'
      consumes 'application/json'

      response(200, 'Successful') do
        let(:id) { create(:area).id }

        schema '$ref' => '#/components/schemas/area'

        include_context 'with integration test'

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

  path '/districts/{district_id}/areas' do
    parameter name: 'district_id', in: :path, type: :string, description: 'district_id'

    get('Array areas by district') do
      tags 'Areas'
      produces 'application/json'
      consumes 'application/json'

      response(200, 'Successful') do
        let(:district) { create(:district) }
        let(:district_id) { district.id }

        schema type: :array, items: { '$ref' => '#/components/schemas/area' }

        before { create_list(:area, 4, district:) }

        include_context 'with integration test'

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.map { |area| area['district_id'] }.uniq.first).to eq(district_id)
          expect(data.size).to eq(4)
        end
      end
    end
  end
end
