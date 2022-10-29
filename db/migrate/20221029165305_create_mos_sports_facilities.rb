class CreateMosSportsFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :mos_sports_facilities do |t|
      t.string :short_name
      t.string :full_name
      t.string :common_name
      t.jsonb :org_info, array: true, default: []
      t.jsonb :object_address, array: true, default: []
      t.string :chief_name
      t.string :chief_position
      t.string :chief_phone
      t.string :public_phone
      t.string :email
      t.string :web_site
      t.string :clarification_working_hours
      t.jsonb :working_hours, array: true, default: []
      t.bigint :global_id
      t.jsonb :geo_data
      t.references :mos_dataset, foreign_key: true, null: false
    end
  end
end
