class Order < ApplicationRecord
  validates :restaurant, presence: true
  validates :menu_url, presence: true
  has_many :personal_orders, :dependent => :destroy
  belongs_to :user
end
