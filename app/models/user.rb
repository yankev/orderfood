class User < ApplicationRecord
  validates :email, unique: true
end
