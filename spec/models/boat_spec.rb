require 'rails_helper'

RSpec.describe Boat, type: :model do
  describe 'validations' do
    it 'has a valid factory'
    it 'is not valid without a name'
    it 'is not valid without a make'
    it 'is not valid without a length'
    it 'has a rating attribute that is optional'
  end

  describe 'assocations' do
    it 'belongs to an owner'
    it 'belongs to a race'
    it 'has many race_crews'
    it 'has many crew through race_crews'
  end
end
