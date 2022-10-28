class CreateMosRows < ActiveRecord::Migration[7.0]
  def change
    create_table :mos_rows do |t|
      t.bigint :global_id
      t.jsonb :geo_data
      t.references :mos_dataset, foreign_key: true, null: false

      t.timestamps
    end
  end
end
