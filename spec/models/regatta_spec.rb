require 'rails_helper'

RSpec.describe.Regatta, type: :model do
  describe 'validations' do
    it 'has a valid factory'
    it 'is invalid without a name'
    it 'is invalid without a start date'
    it 'is invalid without an end date'
  end

  describe 'associations' do
    it 'has many races'
    it 'has many boats through races'
  end
end
