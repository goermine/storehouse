class Product < ApplicationRecord
  belongs_to :category
  validates :name, :image, :score, :price, :url,  presence: true
end
