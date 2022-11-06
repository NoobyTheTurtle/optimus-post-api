class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :short_name
      t.float :square
      t.integer :population

      t.timestamps
    end
    districts_data.each do |data|
      District.find_or_create_by(data)
    end
  end

  def districts_data
    [
      { id: 1, short_name: 'ЦАО', name: 'Центральный', square: 66.18, population: 779_086 },
      { id: 2, short_name: 'САО', name: 'Северный', square: 113.73, population: 1_175_229 },
      { id: 3, short_name: 'СВАО', name: 'Северо-Восточный', square: 101.88, population: 1_427_597 },
      { id: 4, short_name: 'ВАО', name: 'Восточный', square: 154.84, population: 1_514_420 },
      { id: 5, short_name: 'ЮВАО', name: 'Юго-Восточный', square: 117.56, population: 1_432_839 },
      { id: 6, short_name: 'ЮАО', name: 'Южный', square: 131.77, population: 1_773_425 },
      { id: 7, short_name: 'ЮЗАО', name: 'Юго-Западный', square: 111.36, population: 1_442_971 },
      { id: 8, short_name: 'ЗАО', name: 'Западный', square: 153.03, population: 1_383_853 },
      { id: 9, short_name: 'СЗАО', name: 'Северо-Западный', square: 93.28, population: 1_009_217 }
    ]
  end
end
