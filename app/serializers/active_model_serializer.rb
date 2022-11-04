class ActiveModelSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id

  def method_show?
    instance_options[:method] == :show
  end
end
