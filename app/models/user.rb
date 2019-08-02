class User < ApplicationRecord
  has_secure_password
  has_many :pins
  has_many :series, through: :pins

  validates :name, :email, :location, presence: true
  validates :email, uniqueness: true

  scope :top_ten, -> {left_joins(:pins).group(:id).order('COUNT(pins.id) DESC').limit(10)}

  def self.create_with_google(auth)
    self.find_or_create_by(email: auth[:info][:email]) do |u|
      u.name = auth[:info][:name]
      u.location = "Main Street USA"
      u.password = SecureRandom.hex
    end
  end
end
