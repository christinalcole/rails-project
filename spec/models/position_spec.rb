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
    it 'belongs to a user' do
      relationship = Position.reflect_on_association(:user)
      expect(relationship.macro).to eq(:belongs_to)
    end

    it 'has many race_crews' do
      relationship = Position.reflect_on_association(:race_crews)
      expect(relationship.macro).to eq(:has_many)
    end

    it 'has many crews through race_crews' do
      crew_relationship = Position.reflect_on_association(:crews)
      expect(crew_relationship.through_reflection.name).to eq(:race_crews)
    end
  end
end
