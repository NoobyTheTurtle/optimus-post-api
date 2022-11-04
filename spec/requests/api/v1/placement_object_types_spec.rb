# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'PlacementObjectTypes API', type: :request do
  path '/placement_object_types' do
    get('Array placement object types') do
      tags 'Automatic post offices'
      produces 'application/json'
      consumes 'application/json'

      response(200, 'Successful') do
        before { create_list(:placement_object_type, 2) }
        include_context 'with save example response'

        schema type: :array, items: { '$ref' => '#/components/schemas/placement_object_type' }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.size).to eq(2)
        end
      end
    end
  end
end
