class CreateVacuumCleanerStatus < ActiveRecord::Migration[7.0]
  def change
    create_table :vacuum_cleaner_statuses do |t|
      t.integer :successful, array: true, default: []
      t.integer :failed, array: true, default: []
      t.string :failed_text, array: true, default: []

      t.timestamps
    end
  end
end
