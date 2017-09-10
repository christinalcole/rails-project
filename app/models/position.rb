class Position < ApplicationRecord
  has_many :positions_users
  has_many :users, through: :positions_users

  has_many :race_crews, :foreign_key => "race_position_id"
  has_many :crews, through: :race_crews

  validates :name, presence: true
end
