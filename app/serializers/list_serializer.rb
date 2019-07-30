class ListSerializer < ActiveModel::Serializer
  attributes :id_str, :slug, :name, :uri, :subscriber_count, :mode, :description
end
