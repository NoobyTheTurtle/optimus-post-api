class Mos::Model < ActiveRecord::Base
  self.abstract_class = true

  def self.table_name_prefix
    'mos_'
  end
end
