# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1',
        description: 'This is the first version of API'
      },
      components: {
        schemas: {
          district_with_polygon: {
            type: 'object',
            properties: {
              id: { type: 'integer' },
              name: { type: 'string' },
              short_name: { type: 'string' },
              square: { type: 'number' },
              population: { type: 'integer' },
              '2gis_id': { type: 'integer' },
              polygon: {
                type: 'array',
                items: {
                  type: 'array',
                  items: {
                    type: 'array',
                    items: { type: 'number' }
                  }
                }
              },
              polygon_type: { type: 'integer' },
              center_coord: {
                type: 'array',
                items: { type: 'number' }
              }
            },
            required: %w[id name short_name square population 2gis_id polygon polygon_type center_coord]
          },
          district: {
            type: 'object',
            properties: {
              id: { type: 'integer' },
              name: { type: 'string' },
              short_name: { type: 'string' },
              square: { type: 'number' },
              population: { type: 'integer' },
              '2gis_id': { type: 'integer' }
            },
            required: %w[id name short_name square population 2gis_id]
          },
          area_with_polygon: {
            type: 'object',
            properties: {
              id: { type: 'integer' },
              population: { type: 'integer' },
              name: { type: 'string' },
              square: { type: 'number' },
              population_density: { type: 'number' },
              square_housing_stock: { type: 'number' },
              living_square_per_person: { type: 'number' },
              district_id: { type: 'integer' },
              '2gis_id': { type: 'integer' },
              polygon: {
                type: 'array',
                items: {
                  type: 'array',
                  items: {
                    type: 'array',
                    items: { type: 'number' }
                  }
                }
              },
              polygon_type: { type: 'integer' },
              center_coord: {
                type: 'array',
                items: { type: 'number' }
              },
              emblem_url: { type: 'string' }
            },
            required: %w[id population square name population_density square_housing_stock living_square_per_person
                         district_id 2gis_id emblem_url polygon polygon_type center_coord]
          },
          area: {
            type: 'object',
            properties: {
              id: { type: 'integer' },
              population: { type: 'integer' },
              name: { type: 'string' },
              square: { type: 'number' },
              population_density: { type: 'number' },
              square_housing_stock: { type: 'number' },
              living_square_per_person: { type: 'number' },
              district_id: { type: 'integer' },
              '2gis_id': { type: 'integer' },
              emblem_url: { type: 'string' }
            },
            required: %w[id population square name population_density square_housing_stock living_square_per_person
                         district_id 2gis_id emblem_url]
          }
        }
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}/api/v1',
          variables: {
            defaultHost: {
              default: '188.72.109.162:3000'
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
