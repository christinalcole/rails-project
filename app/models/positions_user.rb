class PositionsUser < ApplicationRecord
  belongs_to :position
  belongs_to :user

  validates :skill_level, presence: true
end
