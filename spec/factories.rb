# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "#{Faker::Internet.password}!A3a" }
    after :create, &:mark_as_confirmed!
  end

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

  factory :placement_object_type do
    name { Faker::Company.industry }
  end

  factory :automatic_post_office do
    geo_data { [Faker::Number.decimal(r_digits: 6), Faker::Number.decimal(r_digits: 6)] }
    area { create(:area) }
    is_placed { [true, false].sample }
    address { Faker::Address.full_address }
    placement_object_type { create(:placement_object_type) }
    people_in_range { Faker::Number.number(digits: 5) }
    distance_to_metro { Faker::Number.number(digits: 3) }
    distance_to_bus { Faker::Number.number(digits: 3) }
    predict_a { Faker::Number.decimal(r_digits: 3) }
    predict_b { Faker::Number.decimal(r_digits: 3) }
    predict_c { Faker::Number.decimal(r_digits: 3) }
  end
end
