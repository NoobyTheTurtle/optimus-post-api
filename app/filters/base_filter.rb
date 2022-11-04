class BaseFilter
  class << self
    def call(scope, query_params = {}, order_params = {})
      new(scope, query_params, order_params).call
    end
  end

  def initialize(scope, query_params, order_params)
    @scope = scope
    @query_params = query_params
    @order_params = order_params
  end

  def call
    @scope = order_by(@scope)
  end

  protected

  def order_by(scope)
    return scope if @order_params.blank?

    scope.order(@order_params)
  end

  def safe_param(param)
    ActiveRecord::Base.connection.quote_string(param)
  end
end
