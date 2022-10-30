class ActiveModelSerializer < ActiveModel::Serializer
  attributes :id

  def method_show?
    instance_options[:method] == :show
  end
end
