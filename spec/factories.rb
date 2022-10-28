FactoryBot.define do

  factory :district do
    short_name { Faker::Address.state_abbr }
    name { Faker::Address.street_name }
    square { Faker::Number.decimal(l_digits: 2) }
    population { Faker::Number.number(digits: 6) }
  end

  factory :area do
    district { create(:district) }
    name { Faker::Address.street_name }
    square { Faker::Number.decimal(l_digits: 2) }
    population { Faker::Number.number(digits: 6) }
    population_density { Faker::Number.decimal(l_digits: 2) }
    square_housing_stock { Faker::Number.decimal(l_digits: 2) }
    living_square_per_person { Faker::Number.decimal(l_digits: 2) }
  end
end
