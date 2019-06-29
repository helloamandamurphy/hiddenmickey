class Pin < ApplicationRecord
  belongs_to :user
  validates :disney_id, :image, :title, :description, presence: true
end
