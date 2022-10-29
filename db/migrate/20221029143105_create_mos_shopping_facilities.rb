class CreateMosShoppingFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :mos_shopping_facilities do |t|
      t.bigint :global_id
      t.string :object_type
      t.string :name
      t.string :adm_area
      t.string :district
      t.string :address
      t.string :unom
      t.string :specialization
      t.string :period_of_placement
      t.integer :facility_area
      t.string :contract_status
      t.string :contract_number
      t.string :name_of_business_entity
      t.string :contract_begin
      t.string :contract_end
      t.string :contract_basis
      t.string :start_date_trading
      t.string :end_date_trading
      t.string :contract_type
      t.jsonb :geo_data
      t.references :mos_dataset, foreign_key: true, null: false
    end
  end
end
