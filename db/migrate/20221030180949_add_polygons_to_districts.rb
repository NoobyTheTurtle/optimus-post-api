# frozen_string_literal: true

class AddPolygonsToDistricts < ActiveRecord::Migration[7.0]
  def up
    add_column :districts, '2gis_id', :bigint
    add_column :districts, :polygon, :text
    add_column :districts, :polygon_type, :integer
    add_column :districts, :center_coord, :string
  end

  def down
    remove_column :districts, '2gis_id'
    remove_column :districts, :polygon
    remove_column :districts, :polygon_type
    remove_column :districts, :center_coord
  end
end
