class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :score, :price, :url
end
