class Product < ApplicationRecord
  belongs_to :user
  has_many :product_in_shops, :dependent => :delete_all
  has_many :shops, :through => :product_in_shops

  has_many :product_in_shopping_lists, :dependent => :delete_all
  has_many :shopping_lists, :through => :product_in_shopping_lists

  validates_presence_of :name, :user_id

  accepts_nested_attributes_for :product_in_shops, :allow_destroy => true

  attr_accessor :price
  attr_accessor :quantity

end
