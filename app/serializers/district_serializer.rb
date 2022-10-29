class DistrictSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_name, :square, :population
end
