class User < ApplicationRecord
  has_secure_password
  has_many :products
  has_many :shops

  validates_uniqueness_of :email
  validates_presence_of :email, :password, :password_confirmation
end
