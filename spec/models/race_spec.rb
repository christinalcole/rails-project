require 'rails_helper'

RSpec.describe Race, type: :model do
  describe 'validations' do
    it 'has a valid factory'
    it 'defaults to a name of one if no race name is provided'
    it 'is invalid without a date'
  end

  describe 'associations' do
    it 'belongs to a regatta'
    it 'has many boats'
    it 'has many race_crews'
    it 'has many crew through race_crews'    
  end
end
