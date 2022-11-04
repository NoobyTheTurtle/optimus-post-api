class Area < ApplicationRecord
  has_one_attached :emblem

  has_many :automatic_post_offices

  belongs_to :district
end
