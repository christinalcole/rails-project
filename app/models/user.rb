class User < ApplicationRecord
  has_many :boats, :foreign_key => "owner_id"

  has_many :race_crews, :foreign_key => "crew_id"
  has_many :races, through: :race_crews
  has_many :positions, through: :race_crews

  validates :first_name, :last_name, :email, :phone_number, :weight, presence: true
end
