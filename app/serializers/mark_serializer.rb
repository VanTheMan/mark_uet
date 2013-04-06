class MarkSerializer < ActiveModel::Serializer
  attributes :id, :link, :title, :uploaded_at, :code, :category
end
