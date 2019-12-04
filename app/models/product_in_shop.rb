class ProductInShop < ApplicationRecord
  belongs_to :product
  belongs_to :shop

  validates_presence_of :price
end
