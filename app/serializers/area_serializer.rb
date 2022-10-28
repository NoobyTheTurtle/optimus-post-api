class AreaSerializer < ActiveModel::Serializer
  attributes :id, :population, :square, :name, :population_density, :square_housing_stock, :living_square_per_person
end
