class Series < ApplicationRecord
  has_many :pins
  has_many :users, through: :pins

  validates :release_year, :name, :number_in_set, :park, presence: true
  enum park: { "Disneyland": 0, "Shared": 1, "Walt Disney World": 2 }

  scope :order_by_year, -> {order(release_year: :desc)}
  scope :order_by_park, -> {order(:park)}

  scope :disney_world_pins, -> {where(park: "Walt Disney World")}
  scope :disneyland_pins, -> {where(park: "Disneyland")}

  def show_with_attributes
    "#{release_year} - #{name} - #{park}"
  end
end
