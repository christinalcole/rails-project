require 'rails_helper'

RSpec.describe RaceCrew, type: :model do
  describe 'associations' do
    it 'belongs to a user (as crew)' do
      relationship = RaceCrew.reflect_on_association(:crew)
      expect(relationship.macro).to eq(:belongs_to)
    end

    it 'belongs to a position' do
      relationship = RaceCrew.reflect_on_association(:position)
      expect(relationship.macro).to eq(:belongs_to)
    end

    it 'belongs to a boat' do
      relationship = RaceCrew.reflect_on_association(:boat)
      expect(relationship.macro).to eq(:belongs_to)
    end

    it 'belongs to a race' do
      relationship = RaceCrew.reflect_on_association(:race)
      expect(relationship.macro).to eq(:belongs_to)
    end
  end
end
