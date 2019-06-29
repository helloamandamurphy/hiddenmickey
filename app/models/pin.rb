class Pin < ApplicationRecord
  belongs_to :user
  validates :disney_num, :image, :title, :description, presence: true
end
