class Race < ApplicationRecord
  belongs_to :regatta
  has_many :boats
  has_many :race_crews
  has_many :crews, through: :race_crews

  validates :date, presence: true
  validate :date_cannot_be_in_the_past

  private
  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
