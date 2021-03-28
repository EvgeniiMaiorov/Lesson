class BookSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :title
  belongs_to :author
end
