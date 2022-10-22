class Mos::Model < ApplicationRecord
  self.abstract_class = true

  def self.table_name_prefix
    'mos_'
  end
end
