class CreateMosLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :mos_libraries do |t|
      t.string :common_name
      t.string :full_name
      t.string :short_name
      t.jsonb :org_info, array: true, default: []
      t.jsonb :object_address, array: true, default: []
      t.string :chief_org
      t.string :chief_name
      t.string :chief_position
      t.string :public_phone
      t.string :email
      t.jsonb :working_hours, array: true, default: []
      t.string :clarification_of_working_hours
      t.string :web_site
      t.integer :num_of_seats
      t.integer :num_of_readers
      t.integer :num_of_visitors
      t.bigint :global_id
      t.jsonb :geo_data

      t.references :mos_dataset, foreign_key: true, null: false
    end
  end
end
