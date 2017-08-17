class RaceCrew < ApplicationRecord
  belongs_to :crew, :class_name => "User"
  belongs_to :position
  belongs_to :boat
  belongs_to :race
end
