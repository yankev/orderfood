class PersonalOrder < ApplicationRecord
  belongs_to :order
  validates :price, :presence => true, numericality: true
  validates :name, :presence => true
  validates :items, :presence => true
  belongs_to :user
end
