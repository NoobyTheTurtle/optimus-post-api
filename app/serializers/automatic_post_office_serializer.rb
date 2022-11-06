class AutomaticPostOfficeSerializer < ActiveModelSerializer
  attributes :geo_data, :area_id, :area_name, :district_id, :is_placed, :address, :placement_object_type_id, :people_in_range,
             :distance_to_metro, :distance_to_bus, :predict_a, :predict_b, :predict_c

  def area_name
    object.area&.name
  end
end
