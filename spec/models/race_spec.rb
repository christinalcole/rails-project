require 'rails_helper'

RSpec.describe Race, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:race)).to be_valid
    end

    it 'defaults to a name of one if no race name is provided' do
      race = build(:race)

      expect(race.name).to eq("1")
    end


    it 'is invalid without a date' do
      race = build(:race, date: nil)

      expect(race).not_to be_valid
      expect(race.errors.full_messages).to eq(["Date can't be blank"])
    end
  end

  describe 'associations' do
    it 'belongs to a regatta'
    it 'has many boats'
    it 'has many race_crews'
    it 'has many crew through race_crews'
  end
end
