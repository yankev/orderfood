class Order < ApplicationRecord
  validates :restaurant, presence: true
  validates :menu_url, presence: true
  validates :tax, presence: true, :numericality => { only_integer: true }
  validates :tip, presence: true, :numericality => { only_integer: true }
  has_many :personal_orders, :dependent => :destroy
  belongs_to :user
end
