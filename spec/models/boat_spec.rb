require 'rails_helper'

RSpec.describe Boat, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
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
      expect(boat.errors.full_messages).to eq(["Length is not a number"])
    end

    it 'has a rating attribute that is optional' do
      boat = build(:boat, rating: nil)

      expect(boat).to be_valid
    end

    it 'requires the optional rating to be an integer' do
      boat = build(:boat, rating: "seventy-two")

      expect(boat).not_to be_valid
      expect(boat.errors.full_messages).to eq(["Rating is not an integer"])
    end
  end

  describe 'assocations' do
    it 'belongs to an owner'
    it 'belongs to a race'
    it 'has many race_crews'
    it 'has many crew through race_crews'
  end
end
