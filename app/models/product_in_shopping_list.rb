class ProductInShoppingList < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_list
  validates_presence_of :product_id
end