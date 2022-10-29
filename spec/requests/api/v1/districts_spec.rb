# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Districts API', type: :request do
  path '/districts' do
    get('Array districts') do
      tags 'Districts'
      produces 'application/json'
      consumes 'application/json'

      response(200, 'Successful') do
        before { create_list(:district, 3) }
        include_context 'with integration test'

        schema type: :array, items: { '$ref' => '#/components/schemas/district' }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.size).to eq(3)
        end
      end
    end
  end
end
