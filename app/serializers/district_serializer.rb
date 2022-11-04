class DistrictSerializer < ActiveModelSerializer
  attributes :name, :short_name, :square, :population, :'2gis_id', :automatic_post_office_stats

  attribute :polygon, if: :method_show?
  attribute :polygon_type, if: :method_show?
  attribute :center_coord, if: :method_show?

  def polygon
    JSON.parse(object.polygon)
  end

  def center_coord
    JSON.parse(object.center_coord)
  end

  def automatic_post_office_stats
    {
      placed: object.automatic_post_offices.placed.size,
      not_placed: object.automatic_post_offices.not_placed.size
    }
  end
end
