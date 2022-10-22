class CreateMosDatasets < ActiveRecord::Migration[7.0]
  def change
    create_table :mos_datasets do |t|
      t.string :caption
      t.integer :category_id, index: true
      t.text :keywords
      t.boolean :contains_geodata
      t.string :identification_number

      t.timestamps
    end
  end
end
