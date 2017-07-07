class Order < ApplicationRecord
  validates :restaurant, presence: true
  validates :menu_url, presence: true
end
