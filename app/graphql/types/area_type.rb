# frozen_string_literal: true

module Types
  class AreaType < Types::BaseObject
    field :id, ID, null: false
    field :population, Integer
    field :square, Float
    field :population_density, Float
    field :square_housing_stock, Float
    field :living_square_per_person, Float
    field :name, String
    field :emblem_url, String
    field :district_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def emblem_url
      return unless object.emblem.attached?

      rails_blob_url(object.emblem, host: ENV['APP_HOST'])
    end
  end
end
