# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Automatic post office API', type: :request do
  path '/automatic_post_offices/{id}' do
    parameter name: 'id', in: :path, type: :number, description: 'id'
    let(:id) { 0 }

    get('Show automatic post office by id') do
      tags 'Automatic post offices'
      produces 'application/json'
      consumes 'application/json'

      include_context 'with authorization'

      response(200, 'Successful') do
        let(:automatic_post_office) { create(:automatic_post_office) }
        let(:id) { automatic_post_office.id }

        schema '$ref' => '#/components/schemas/automatic_post_office'

        include_context 'with save example response'

        run_test! do
          body = JSON.parse(response.body)
          expect(body['id']).to eq(id)
        end
      end

      response(404, 'Not found') do
        run_test!
      end
    end
  end

  path '/automatic_post_offices/export_xlsx' do
    post('Export xlsx file with automatic post offices data') do
      tags 'Automatic post offices'
      produces 'application/octet-stream'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ids: { type: :array, items: { type: :integer }, description: "Filter by array automatic post office id's",
                 example: [] },
          area_id: { type: :integer, description: 'Filter by area id', example: 1 },
          district_id: { type: :integer, description: 'Filter by district id', example: 7 },
          placement_object_type_id: { type: :integer, description: 'Filter by placement object type id', example: 3 },
          is_placed: { type: :boolean, description: 'Automatic post office is placed?' },
          sort: {
            type: :string,
            description: "Sorting by object fields. Before field: '+' or nothing -> ASC, '-' -> DESC",
            example: '-distance_to_metro,distance_to_bus,+predict_a'
          }
        }
      }, description: 'Filters'

      let(:params) { {} }

      include_context 'with authorization'

      response(404, 'Not found') do
        run_test!
      end

      response(200, 'Successful') do
        before { create_list(:automatic_post_office, 2) }
        run_test!
      end
    end
  end

  path '/automatic_post_offices' do
    post('Array automatic post offices with pagination') do
      tags 'Automatic post offices'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ids: { type: :array, items: { type: :integer }, description: "Filter by array automatic post office id's",
                 example: [] },
          page: { type: :integer, description: 'Page number', example: 1 },
          per_page: { type: :integer, description: 'Number of elements per page', example: 1 },
          area_id: { type: :integer, description: 'Filter by area id', example: 1 },
          district_id: { type: :integer, description: 'Filter by district id', example: 7 },
          placement_object_type_id: { type: :integer, description: 'Filter by placement object type id', example: 3 },
          is_placed: { type: :boolean, description: 'Automatic post office is placed?' },
          sort: {
            type: :string,
            description: "Sorting by object fields. Before field: '+' or nothing -> ASC, '-' -> DESC",
            example: '-distance_to_metro,distance_to_bus,+predict_a'
          }
        }
      }, description: 'Filters'

      let(:params) { {} }

      include_context 'with authorization'

      response(200, 'Successful without pagination') do
        before { create_list(:automatic_post_office, 2) }

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['automatic_post_offices'].size).to eq(2)
          expect(data['meta']).to eq(nil)
        end
      end

      response(200, 'Successful with filtered by area_id ') do
        let(:area) { create(:area) }
        let(:params) { { area_id: area.id } }

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        before do
          create_list(:automatic_post_office, 2, area:)
          create_list(:automatic_post_office, 2)
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['automatic_post_offices'].size).to eq(2)
        end
      end

      response(200, 'Successful with filtered by district_id ') do
        let(:district) { create(:district) }
        let(:params) { { district_id: district.id } }

        before do
          create(:automatic_post_office, area: create(:area, district:))
          create(:automatic_post_office, area: create(:area, district:))
          create_list(:automatic_post_office, 2)
        end

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['automatic_post_offices'].size).to eq(2)
          expect(data['automatic_post_offices'].map { |apo| apo['area_id'] }.uniq.count).to eq(2)
        end
      end

      response(200, 'Successful with filtered by placement_object_type_id ') do
        let(:placement_object_type) { create(:placement_object_type) }
        let(:params) { { placement_object_type_id: placement_object_type.id } }

        before do
          create_list(:automatic_post_office, 2, placement_object_type:)
          create_list(:automatic_post_office, 2)
        end

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['automatic_post_offices'].size).to eq(2)
        end
      end

      response(200, 'Successful with filtered by is_placed') do
        let(:is_placed) { [true, false].sample }
        let(:params) { { is_placed: } }

        before do
          create_list(:automatic_post_office, 2, is_placed:)
          create_list(:automatic_post_office, 2, is_placed: !is_placed)
        end

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['automatic_post_offices'].size).to eq(2)
        end
      end

      response(200, 'Successful with sort ASC') do
        let(:params) { { sort: 'people_in_range' } }
        let(:array) { create_list(:automatic_post_office, 4) }

        before { array }

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          sorted_ids = array.sort { |x, y| x.people_in_range <=> y.people_in_range }.pluck(:id)
          expect(data['automatic_post_offices'].map { |apo| apo['id'] }).to eq(sorted_ids)
        end
      end

      response(200, 'Successful with sort DESC') do
        let(:params) { { sort: '-people_in_range' } }
        let(:array) { create_list(:automatic_post_office, 4) }

        before { array }

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          sorted_ids = array.sort { |x, y| y.people_in_range <=> x.people_in_range }.pluck(:id)
          expect(data['automatic_post_offices'].map { |apo| apo['id'] }).to eq(sorted_ids)
        end
      end

      response(200, 'Successful filtered by ids') do
        let(:ids) { [create(:automatic_post_office).id, create(:automatic_post_office).id] }
        let(:params) { { ids: } }
        let(:array) { create_list(:automatic_post_office, 2) }

        before { array }

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          expect((data['automatic_post_offices'].map { |apo| apo['id'] } - ids).size).to eq(0)
        end
      end

      response(200, 'Successful with pagination') do
        let(:params) { { page: 1, per_page: 1 } }
        before { create_list(:automatic_post_office, 2) }

        include_context 'with save example response'

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['automatic_post_offices'].size).to eq(1)
          expect(data['meta'].keys.count).to eq(5)
        end
      end
    end
  end
end
