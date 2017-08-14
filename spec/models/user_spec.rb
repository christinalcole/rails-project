require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'is invalid without a first_name' do
      user = build(:user, first_name: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq("First_name can't be blank")
    end
    it 'is invalid without a last_name' do
      user = build(:user, last_name: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq("Last_name can't be blank")
    end
    it 'is invalid without an email' do
      user = build(:user, email: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq("Email can't be blank")
    end
    it 'is invalid without a phone number' do
      user = build(:user, phone_number: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq("Phone_number can't be blank")
    end
    it 'is invalid without a weight' do
      user = build(:user, weight: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq("Weight can't be blank")
    end
  end

  describe 'associations' do
    context 'as owner' do
      it 'has many boats'
    end
    context 'as crew' do
      it 'has many race_crews'
      it 'has many races through race_crews'
      it 'has many positions through race_crews'
    end
  end
end
