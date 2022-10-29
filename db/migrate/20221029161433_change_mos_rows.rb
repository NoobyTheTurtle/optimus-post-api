class ChangeMosRows < ActiveRecord::Migration[7.0]
  def change
    remove_column :mos_rows, :created_at
    remove_column :mos_rows, :updated_at
    add_column :mos_rows, :data, :jsonb
  end
end
