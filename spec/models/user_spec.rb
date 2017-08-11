require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'has a valid factory'
    it 'is invalid without a first_name'
    it 'is invalid without a last_name'
    it 'is invalid without an email'
    it 'is invalid without a phone number'
    it 'is invalid without a weight'
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
