class Series < ApplicationRecord
  has_many :pins
  has_many :users, through: :pins

  validates :release_year, :name, :number_in_set, :park, presence: true
end
