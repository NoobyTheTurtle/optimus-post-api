class Mos::Dataset < Mos::Model
  has_many :mos_rows, class_name: 'Mos::Row', foreign_key: :mos_dataset_id
end
