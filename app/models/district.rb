class District < ApplicationRecord
  has_many :areas
  has_many :automatic_post_offices, through: :areas
end
