class User < ApplicationRecord
  has_secure_password
  has_many :products
  has_many :shops
  has_many :shopping_lists

  validates_uniqueness_of :email
  validates_presence_of :email, :password, :password_confirmation
end
