class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :series
  validates :number, :image, :status, :subject, presence: true
  validates :series_id, presence: true
  validates_associated :series

  #accepts_nested_attributes_for :series

  #better to write custom method here to prevent duplicates
  def series_attributes=(attributes)
    series = Series.find_or_create_by(attributes)
    self.series = series if series.valid? || !self.series
  end

  scope :for_trade, -> {where(status: "For Trade")}
  scope :for_sale, -> {where(status: "For Sale")}
  scope :by_subject, -> {order(:subject)}
end
