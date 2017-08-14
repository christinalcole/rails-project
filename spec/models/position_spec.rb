require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:position)).to be_valid
    end

    it 'is not valid without a name' do
      position = build(:position, name: nil)

      expect(position).not_to be_valid
      expect(position.errors.full_messages).to eq(["Name can't be blank"])
    end
  end

  describe 'associations' do
    it 'belongs to a user'
    it 'has many race_crews'
    it 'has many crew through race_crews'
  end
end
