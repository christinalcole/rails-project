class Position < ApplicationRecord
  belongs_to :user, optional: true
  has_many :race_crews
  has_many :crews, through: :race_crews

  validates :name, presence: true
end
