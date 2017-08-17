class Boat < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  belongs_to :race, optional: true
  has_many :race_crews

  validates :name, :make, :length, presence: true
  validates :rating, numericality: {only_integer: true, allow_nil: true}
  validate :length_is_positive_number

  private
  def length_is_positive_number
    if length.present? && length < 1
      errors.add(:length, "#{length} isn't a valid length. Please enter a number--e.g., 40, not forty--that is greater than 0.")
    end
  end
end
