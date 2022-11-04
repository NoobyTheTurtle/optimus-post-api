require 'csv'

class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :address
      t.float :square
      t.integer :year
      t.integer :floors
      t.integer :entrances
      t.integer :rooms
    end
    path = "#{Rails.root}/db/initial_data/houses.csv"
    if File.exist?(path)
      data = CSV.parse(File.open(path), headers: true)
      data.each do |el|
        house = el.to_h
        House.create(
          address: house['address'],
          square: house['square'],
          year: house['year'],
          floors: house['floors'],
          entrances: house['entrances'],
          rooms: house['rooms']
        )
      end
    end
  end
end
