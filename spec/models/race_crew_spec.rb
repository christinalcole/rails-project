require 'rails_helper'

RSpec.describe RaceCrew, type: :model do
  describe 'associations' do
    it 'belongs to a user (as crew)'
    it 'belongs to a position'
    it 'belongs to a boat'
    it 'belongs to a race'
  end
end
