class AutomaticPostOffice < ApplicationRecord
  belongs_to :area, optional: true
  belongs_to :placement_object_type, optional: true

  has_one :district, through: :area

  scope :placed, -> { where(is_placed: true) }
  scope :not_placed, -> { where(is_placed: false) }
end
