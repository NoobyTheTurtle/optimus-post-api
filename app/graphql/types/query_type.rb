# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :districts, [DistrictType], null: false, description: 'Moscow districts'

    field :district, DistrictType, description: 'Moscow district by id', null: true do
      argument :id, ID, required: true
    end

    field :area, AreaType, description: 'Moscow area by id', null: true do
      argument :id, ID, required: true
    end

    def district(id:)
      District.includes(:areas).find_by(id:)
    end

    def districts
      District.includes(:areas).all
    end

    def area(id:)
      Area.with_attached_emblem.find_by(id:)
    end
  end
end
