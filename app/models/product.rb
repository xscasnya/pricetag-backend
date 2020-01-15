class Product < ApplicationRecord
  belongs_to :user
  has_many :product_in_shops, dependent: :destroy
  has_many :shops, :through => :product_in_shops

  accepts_nested_attributes_for :product_in_shops

  validates_presence_of :name, :user_id
end
