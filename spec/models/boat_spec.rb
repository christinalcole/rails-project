require 'rails_helper'

RSpec.describe Boat, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:boat)).to be_valid
    end

    it 'is not valid without a name' do
      boat = build(:boat, name: nil)

      expect(boat).not_to be_valid
      expect(boat.errors.full_messages).to eq(["Name can't be blank"])
    end
    it 'is not valid without a make' do
      boat = build(:boat, make: nil)

      expect(boat).not_to be_valid
      expect(boat.errors.full_messages).to eq(["Make can't be blank"])
    end
    it 'is not valid without a length' do
      boat = build(:boat, length: nil)

      expect(boat).not_to be_valid
      expect(boat.errors.full_messages).to eq(["Length can't be blank"])
    end

    it "requires length be a number" do
      boat = build(:boat, length: "seven")

      expect(boat).not_to be_valid
      expect(boat.errors.full_messages).to eq(["Length #{boat.length} isn't a valid length. Please enter a number--e.g., 40, not forty--that is greater than 0."])
    end

    it 'has a rating attribute that is optional' do
      boat = build(:boat, rating: nil)

      expect(boat).to be_valid
    end

    it 'requires the optional rating to be a number' do
      boat = build(:boat, rating: "seventy-two")

      expect(boat).not_to be_valid
      expect(boat.errors.full_messages).to eq(["Rating is not a number"])
    end
    it 'requires the optional rating to be an integer' do
      boat = build(:boat, rating: 22.5)

      expect(boat).not_to be_valid
      expect(boat.errors.full_messages).to eq(["Rating must be an integer"])
    end
  end

  describe 'assocations' do
      it 'belongs to an owner' do
        relationship = Boat.reflect_on_association(:owner)
        expect(relationship.macro).to eq(:belongs_to)
      end

      it 'belongs to a race' do
        relationship = Boat.reflect_on_association(:race)
        expect(relationship.macro).to eq(:belongs_to)
      end

      it 'has many race_crews' do
        relationship = Boat.reflect_on_association(:race_crews)
        expect(relationship.macro).to eq(:has_many)
      end

      xit 'has many crews through race_crews' do
        crew_relationship = Boat.reflect_on_association(:crews)
        crew_relationship.through_reflection
    end
  end
end
