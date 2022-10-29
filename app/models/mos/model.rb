class Mos::Model < ApplicationRecord
  self.abstract_class = true

  def self.truncate
    connection.truncate(table_name)
  end

  def self.table_name_prefix
    'mos_'
  end
end
