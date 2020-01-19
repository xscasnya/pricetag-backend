class Shop < ApplicationRecord
  belongs_to :user
  has_many :product_in_shops, :dependent => :delete_all
  has_many :products, :through => :product_in_shops

  validates_presence_of :name, :address

  accepts_nested_attributes_for :product_in_shops, :allow_destroy => true

  attr_accessor :products_to_report
  attr_accessor :total
end
