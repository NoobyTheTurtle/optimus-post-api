class CreateMosDatasets < ActiveRecord::Migration[7.0]
  def change
    create_table :mos_datasets do |t|
      t.integer :version_number
      t.integer :release_number
      t.string :caption
      t.string :publish_date
      t.integer :category_id
      t.integer :department_id
      t.text :full_description
      t.text :keywords
      t.boolean :contains_geodata
      t.boolean :contains_acc_env_data
      t.boolean :is_foreign
      t.boolean :is_seasonal
      t.boolean :is_archive
      t.boolean :is_new
      t.string :identification_number
      t.string :season
      t.string :last_update_date
      t.string :sef_url
    end
  end
end
