class AreaSerializer < ActiveModelSerializer
  attributes :population, :square, :name, :population_density, :square_housing_stock,
             :living_square_per_person, :district_id, :'2gis_id', :emblem_url, :automatic_post_office_stats

  attribute :polygon, if: :method_show?
  attribute :polygon_type, if: :method_show?
  attribute :center_coord, if: :method_show?

  def polygon
    JSON.parse(object.polygon)
  end

  def center_coord
    JSON.parse(object.center_coord)
  end

  def emblem_url
    return '' unless object.emblem.attached?

    rails_blob_url(object.emblem)
  end

  def automatic_post_office_stats
    {
      placed: object.automatic_post_offices.placed.count,
      not_placed: object.automatic_post_offices.not_placed.count
    }
  end
end
