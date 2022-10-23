class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :short_name
      t.float :square
      t.integer :population

      t.timestamps
    end
  end
end
