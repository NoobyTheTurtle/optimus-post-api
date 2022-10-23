class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.integer :population
      t.float :square
      t.string :name
      t.float :population_density
      t.float :square_housing_stock
      t.float :living_square_per_person
      t.references :district, foreign_key: true, null: false

      t.timestamps
    end
  end
end
