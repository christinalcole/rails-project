require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'validations' do
    it 'has a valid factory'
    it 'is not valid without a name'
  end

  describe 'associations' do
    it 'belongs to a user'
    it 'has many race_crews'
    it 'has many crew through race_crews'
  end
end
