class CreateMosMultifunctionalCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :mos_multifunctional_centers do |t|
      t.string :common_name
      t.string :full_name
      t.string :short_name
      t.string :adm_area
      t.string :district
      t.string :address
      t.string :chief_name
      t.string :chief_position
      t.string :public_phone
      t.jsonb :working_hours, array: true, default: []
      t.string :clarification_of_working_hours
      t.string :open_date
      t.string :extra_services, array: true, default: []
      t.float :center_area
      t.integer :window_count
      t.string :web_site
      t.jsonb :availability, array: true, default: []
      t.bigint :global_id
      t.jsonb :geo_data
      t.references :mos_dataset, foreign_key: true, null: false
    end
  end
end
