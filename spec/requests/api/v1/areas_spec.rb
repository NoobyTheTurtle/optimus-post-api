require 'swagger_helper'

RSpec.describe 'Areas API', type: :request do
  path '/areas/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    let(:id) { 0 }

    get('Show area by id') do
      tags 'Areas'
      produces 'application/json'
      consumes 'application/json'

      include_context 'with authorization'

      response(200, 'Successful') do
        let(:area) { create(:area) }
        let(:id) { area.id }

        schema '$ref' => '#/components/schemas/area_with_polygon'

        include_context 'with save example response'

        run_test! do
          body = JSON.parse(response.body)
          expect(body['id']).to eq(id)
          expect(body['polygon_type']).to eq(area.polygon_type)
          expect(body['polygon']).to eq(JSON.parse(area.polygon))
          expect(body['center_coord']).to eq(JSON.parse(area.center_coord))
        end
      end

      response(404, 'Not found') do
        run_test!
      end
    end
  end

  path '/districts/{district_id}/areas' do
    parameter name: 'district_id', in: :path, type: :integer, description: 'District id'

    get('Array areas by district') do
      tags 'Areas'
      produces 'application/json'
      consumes 'application/json'

      let(:district_id) { 0 }

      include_context 'with authorization'

      response(200, 'Successful') do
        let(:district) { create(:district) }
        let(:district_id) { district.id }

        schema type: :array, items: { '$ref' => '#/components/schemas/area' }

        before do
          create_list(:area, 2)
          create_list(:area, 2, district:)
        end

        include_context 'with save example response'

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.map { |area| area['district_id'] }.uniq.first).to eq(district_id)
          expect(data.size).to eq(2)
        end
      end
    end
  end
end
