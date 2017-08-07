class RaceCrew < ApplicationRecord
  belongs_to :user
  belongs_to :position
  belongs_to :boat
  belongs_to :race
end
