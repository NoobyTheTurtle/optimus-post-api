# frozen_string_literal: true

class CreatePlacementObjectTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :placement_object_types do |t|
      t.string :name
    end

    ['Библиотека', 'Спортивный объект', 'Киоск', 'ТЦ', 'МФЦ', 'Культурный объект'].each do |name|
      PlacementObjectType.create(name:)
    end
  end
end
