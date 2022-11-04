class CreateAutomaticPostOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :automatic_post_offices do |t|
      t.float :geo_data, array: true, default: []
      t.references :area, foreign_key: true
      t.boolean :is_placed, default: false, index: true
      t.string :address
      t.references :placement_object_type, foreign_key: true
      t.integer :people_in_range, index: true
      t.integer :distance_to_metro, index: true
      t.integer :distance_to_bus, index: true
      t.float :predict_a, index: true
      t.float :predict_b, index: true
      t.float :predict_c, index: true

      t.timestamps null: true
    end
  end
end
