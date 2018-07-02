class Category < ApplicationRecord
  has_many :products, -> { order(score: :desc) },  dependent: :destroy
  validates :name, presence: true
end
