class ProductInShop < ApplicationRecord
  belongs_to :shop
  belongs_to :product

  validates_presence_of :price
  validates :product_id, uniqueness: { scope: :shop_id }
end
