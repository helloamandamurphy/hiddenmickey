class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :series
  validates :disney_num, :image, :title, :description, presence: true
end
