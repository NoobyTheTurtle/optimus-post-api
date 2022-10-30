# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Districts API', type: :request do
  path '/districts' do
    get('Array districts') do
      tags 'Districts'
      produces 'application/json'
      consumes 'application/json'

      response(200, 'Successful') do
        before { create_list(:district, 2) }
        include_context 'with integration test'

        schema type: :array, items: { '$ref' => '#/components/schemas/district' }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.size).to eq(2)
        end
      end
    end
  end

  path '/districts/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show district by id') do
      tags 'Districts'
      produces 'application/json'
      consumes 'application/json'

      response(200, 'Successful') do
        let(:district) { create(:district) }
        let(:id) { district.id }

        schema '$ref' => '#/components/schemas/district_with_polygon'

        include_context 'with integration test'

        run_test! do
          body = JSON.parse(response.body)
          expect(body['id']).to eq(id)
          expect(body['polygon_type']).to eq(district.polygon_type)
          expect(body['polygon']).to eq(JSON.parse(district.polygon))
          expect(body['center_coord']).to eq(JSON.parse(district.center_coord))
        end
      end

      response(404, 'Not found') do
        let(:id) { 0 }
        run_test!
      end
    end
  end
end
