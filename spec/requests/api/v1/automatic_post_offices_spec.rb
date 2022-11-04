# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Automatic post office API', type: :request do
  path '/automatic_post_offices/{id}' do
    parameter name: 'id', in: :path, type: :number, description: 'id'

    get('Show automatic post office by id') do
      tags 'Automatic post offices'
      produces 'application/json'
      consumes 'application/json'

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
        let(:id) { 0 }
        run_test!
      end
    end
  end

  path '/automatic_post_offices' do
    get('Array automatic post offices with pagination') do
      tags 'Automatic post offices'
      produces 'application/json'
      consumes 'application/json'

      parameter name: 'page', in: :query, type: :number, description: 'Page number', required: false, example: 1
      parameter name: 'per_page', in: :query, type: :number, description: 'Number of elements per page',
                required: false, example: 1
      parameter name: 'area_id', in: :query, type: :number, description: 'Filter by area id', required: false
      parameter name: 'district_id', in: :query, type: :number, description: 'Filter by district id', required: false
      parameter name: 'placement_object_type_id', in: :query, type: :number,
                description: 'Filter by placement object type id', required: false
      parameter name: 'is_placed', in: :query, type: :boolean, description: 'Automatic post office is placed?',
                required: false
      parameter name: 'sort', in: :query, type: :string, description: "Sorting by object fields. Before field: '+' or nothing -> ASC, '-' -> DESC", required: false,
                example: '-distance_to_metro,distance_to_bus,+predict_a'

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
        let(:area_id) { area.id }

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
        let(:district_id) { district.id }

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
        let(:placement_object_type_id) { placement_object_type.id }

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
        let(:sort) { 'people_in_range' }
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
        let(:sort) { '-people_in_range' }
        let(:array) { create_list(:automatic_post_office, 4) }

        before { array }

        schema '$ref' => '#/components/schemas/automatic_post_office_with_meta'

        run_test! do |response|
          data = JSON.parse(response.body)
          sorted_ids = array.sort { |x, y| y.people_in_range <=> x.people_in_range }.pluck(:id)
          expect(data['automatic_post_offices'].map { |apo| apo['id'] }).to eq(sorted_ids)
        end
      end

      response(200, 'Successful with pagination') do
        let(:page) { 1 }
        let(:per_page) { 1 }
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
