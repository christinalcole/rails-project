class Regatta < ApplicationRecord
  has_many :races
  has_many :boats, through: :races
   
  validates :name, :start_date, :end_date, presence: true
  validate :start_date_cannot_be_after_end_date

  private
  def start_date_cannot_be_after_end_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:start_date, "can't be after end date")
    end
  end
end
