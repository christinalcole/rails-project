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

    it "validates that the date isn't in the past" do
      race = build(:race, date: "1975-04-28")

      expect(race).not_to be_valid
      expect(race.errors.full_messages).to eq(["Date can't be in the past"])
    end
  end

  describe 'associations' do
    it 'belongs to a regatta' do
      relationship = Race.reflect_on_association(:regatta)
      expect(relationship.macro).to eq(:belongs_to)
    end

    it 'has many boats' do
      relationship = Race.reflect_on_association(:boats)
      expect(relationship.macro).to eq(:has_many)
    end

    it 'has many race_crews' do
      relationship = Race.reflect_on_association(:race_crews)
      expect(relationship.macro).to eq(:has_many)
    end

    xit 'has many crews through race_crews' do
      crew_relationship = Race.reflect_on_association(:crews)
      crew_relationship.through_reflection
    end
  end
end
