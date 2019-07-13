class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :series
  validates :number, :image, :status, :subject, presence: true

  #scope :for_trade, -> { where status: "For Trade" }
end
