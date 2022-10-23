# frozen_string_literal: true

module Types
  class DistrictType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :short_name, String
    field :square, Float
    field :population, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :areas, [AreaType]
  end
end
