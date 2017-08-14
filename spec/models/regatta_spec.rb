require 'rails_helper'

RSpec.describe.Regatta, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:regatta)).to be_valid
    end

    it 'is invalid without a name' do
      regatta = build(:regatta, name: nil)

      expect(regatta).not_to be_valid
      expect(regatta.errors.full_messages).to eq(["Name can't be blank"])
    end
    it 'is invalid without a start date' do
      regatta = build(:regatta, start_date: nil)

      expect(regatta).not_to be_valid
      expect(regatta.errors.full_messages).to eq(["Start date can't be blank"])
    end
    it 'is invalid without an end date' do
      regatta = build(:regatta, end_date: nil)

      expect(regatta).not_to be_valid
      expect(regatta.errors.full_messages).to eq(["End date can't be blank"])
    end

    it 'allows start date and end date to be the same' do
      regatta = build(:regatta, start_date: 2017-06-21, end_date: 2017-06-21)

      expect(regatta).to be_valid
    end
    it 'does not allow a start date to be after an end date' do
      regatta = build(:regatta, start_date: 2017-06-21, end_date: 2017-06-19)

      expect(regatta).not_to be_valid
      expect(regatta.errors.full_messages).to eq(["Start date can't be after end date"])
    end
  end

  describe 'associations' do
    it 'has many races'
    it 'has many boats through races'
  end
end
