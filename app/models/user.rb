class User < ApplicationRecord
  has_secure_password
  has_many :pins
  has_many :series, through: :pins

  validates :name, :email, :location, presence: true
  validates :email, uniqueness: true
end
