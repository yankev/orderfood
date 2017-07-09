class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :orders, :dependent => :destroy
  has_many :personal_orders, :dependent => :destroy
end
