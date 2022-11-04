# frozen_string_literal: true
class AutomaticPostOfficesFilter < BaseFilter
  def call
    @scope = filter_by_area_id(@scope)
    @scope = filter_by_district_id(@scope)
    @scope = filter_by_placement_object_type_id(@scope)
    @scope = filter_by_is_placed(@scope)
    super
  end

  private

  def filter_by_area_id(scope)
    return scope unless @query_params[:area_id].present?

    scope.where(area_id: @query_params[:area_id])
  end

  def filter_by_district_id(scope)
    return scope unless @query_params[:district_id].present?

    scope.joins(area: :district).where(districts: { id: @query_params[:district_id] })
  end

  def filter_by_placement_object_type_id(scope)
    return scope unless @query_params[:placement_object_type_id].present?

    scope.where(placement_object_type_id: @query_params[:placement_object_type_id])
  end

  def filter_by_is_placed(scope)
    return scope unless @query_params[:is_placed].present? && %w[true false].include?(@query_params[:is_placed])

    scope.where(is_placed: @query_params[:is_placed] == 'true')
  end
end
