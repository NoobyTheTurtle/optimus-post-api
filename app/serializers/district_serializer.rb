class DistrictSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_name, :square, :population

  has_many :areas
end
