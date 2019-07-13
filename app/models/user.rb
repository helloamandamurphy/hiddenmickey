class User < ApplicationRecord
  has_secure_password
  has_many :pins
  has_many :series, through: :pins

  validates :name, :email, :location, presence: true
  validates :email, uniqueness: true

  def self.create_with_google(auth)
    self.find_or_create_by(email: auth[:info][:email]) do |u|
      u.name = auth[:info][:name]
      u.location = "Main Street USA"
      u.password = SecureRandom.hex
    end
  end
end
