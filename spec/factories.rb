# frozen_string_literal: true

FactoryBot.define do
  factory :district do
    short_name { Faker::Address.state_abbr }
    name { Faker::Address.street_name }
    square { Faker::Number.decimal(l_digits: 2) }
    population { Faker::Number.number(digits: 6) }
    polygon_type { [0, 1].sample }
    send('2gis_id') { Faker::Number.number(digits: 10) }
    center_coord { [Faker::Number.decimal(r_digits: 6), Faker::Number.decimal(r_digits: 6)] }
    polygon do
      [[[Faker::Number.decimal(r_digits: 6), Faker::Number.decimal(r_digits: 6)],
        [Faker::Number.decimal(r_digits: 6), Faker::Number.decimal(r_digits: 6)]]]
    end
  end

  factory :area do
    district { create(:district) }
    name { Faker::Address.street_name }
    square { Faker::Number.decimal(r_digits: 2) }
    population { Faker::Number.number(digits: 6) }
    population_density { Faker::Number.decimal(l_digits: 2) }
    square_housing_stock { Faker::Number.decimal(l_digits: 2) }
    living_square_per_person { Faker::Number.decimal(l_digits: 2) }
    polygon_type { [0, 1].sample }
    send('2gis_id') { Faker::Number.number(digits: 10) }
    center_coord { [Faker::Number.decimal(r_digits: 6), Faker::Number.decimal(r_digits: 6)] }
    polygon do
      [[[Faker::Number.decimal(r_digits: 6), Faker::Number.decimal(r_digits: 6)],
        [Faker::Number.decimal(r_digits: 6), Faker::Number.decimal(r_digits: 6)]]]
    end

    to_create do |area|
      emblem_file = File.open("#{Rails.root}/spec/support/fixtures/emblem.png")
      area.emblem.attach(io: emblem_file, filename: 'emblem.png')
      area.save
    end
  end
end
