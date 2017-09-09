require 'rails_helper'

RSpec.feature 'Positions Management', type: :feature do
  context 'create positions' do
    scenario 'a new position can be added to the db'
    scenario 'an existing position can be updated'
    scenario 'an existing position can be removed'
    scenario 'existing positions in the database can be listed'
  end
end
