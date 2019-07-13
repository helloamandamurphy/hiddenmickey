class Series < ApplicationRecord
  has_many :pins
  has_many :users, through: :pins

  validates :release_year, :name, :number_in_set, :park, presence: true

  scope :order_by_year, -> {order(release_year: :desc)}
  scope :disney_world_pins, -> {where(park: "Walt Disney World")}
  scope :disneyland_pins, -> {where(park: "Disneyland")}
end
