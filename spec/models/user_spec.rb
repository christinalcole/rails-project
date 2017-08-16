require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'is invalid without a first_name' do
      user = build(:user, first_name: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["First name can't be blank"])
    end
    it 'is invalid without a last_name' do
      user = build(:user, last_name: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Last name can't be blank"])
    end
    it 'is invalid without an email' do
      user = build(:user, email: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Email can't be blank"])
    end
    it 'is invalid without a phone number' do
      user = build(:user, phone_number: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Phone number can't be blank"])
    end
    it 'is invalid without a weight' do
      user = build(:user, weight: nil)

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Weight can't be blank"])
    end
  end

  describe 'associations' do
    context 'as owner' do
      it 'has many boats' do
        relationship = User.reflect_on_association(:boats)
        expect(relationship.macro).to eq(:has_many)
      end
    end

    context 'as crew' do
      it 'has many race_crews' do
        relationship = User.reflect_on_association(:race_crews)
        expect(relationship.macro).to eq(:has_many)
      end

      xit 'has many races through race_crews' do
        race_relationship = User.reflect_on_association(:races)
        race_relationship.through_reflection
      end
      xit 'has many positions through race_crews' do
        position_relationship = User.reflect_on_association(:positions)
        position_relationship.through_reflection
      end
    end
  end
end
