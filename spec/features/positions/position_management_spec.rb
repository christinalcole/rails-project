require 'rails_helper'

RSpec.feature 'Positions Management', type: :feature do
  context 'create positions' do
    scenario 'a form exists to add a new position to the db' do
      visit new_position_path
      expect(page).to have_css("form#new_position")
    end
    scenario 'a new position is created when the form is submitted' do
      visit new_position_path
      fill_in 'position[name]', with: 'Navigator'
      click_button 'Create Position'

      expect(Position.last.name).to eq("Navigator")
      expect(page).to have_content("Navigator")
    end
  end

  context 'editing positions' do
    scenario 'an existing position can be updated'
    scenario 'an existing position can be removed'
  end

  context 'listing positions' do
    scenario 'existing positions in the database can be listed'
  end
end
