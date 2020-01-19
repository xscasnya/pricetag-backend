class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :product_in_shopping_lists, :dependent => :delete_all
  has_many :products, :through => :product_in_shopping_lists

  validates_presence_of :user_id, :name

  accepts_nested_attributes_for :product_in_shopping_lists, :allow_destroy => true
end
