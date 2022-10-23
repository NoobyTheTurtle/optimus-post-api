class Area < ApplicationRecord
  has_one_attached :emblem
  belongs_to :district
end
