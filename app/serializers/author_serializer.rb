class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :token
end