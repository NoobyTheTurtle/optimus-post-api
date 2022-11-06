# frozen_string_literal: true

class AddPolygonsToAreas < ActiveRecord::Migration[7.0]
  def up
    add_column :areas, '2gis_id', :bigint
    add_column :areas, :polygon, :text
    add_column :areas, :polygon_type, :integer
    add_column :areas, :center_coord, :string
  end

  def down
    remove_column :areas, '2gis_id'
    remove_column :areas, :polygon
    remove_column :areas, :polygon_type
    remove_column :areas, :center_coord
  end
end
