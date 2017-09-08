require 'rails_helper'

RSpec.feature 'Position Management' do
  context 'nested resource' do
    it 'has an index page nested under a user' do
      visit user_position_path
      expect(page.status.code).to eq(200)
    end
    it 'lists the positions of the logged-in user'
  end

  context 'user wants to add positions to their profile' do
    scenario 'there is a link to add new position(s)' do
      visit user_position_path
      expect(page).to have_link("Add Crew Positions")
    end
    scenario 'there is no link to add position(s) if a user profile already has positions'
    scenario 'there is a form to add new position(s)' do
      visit user_position_path
      click_link("Add Crew Positions")
      expect(page).to have(css"form#new_position")
    end
    scenario 'the form should display existing positions in the db' do
      position = create(:position)
      visit new_user_position_path
      expect(page).to have_content(postion.name)
    end
    scenario 'the user should gain new position(s) after the form is submitted'
  end

  context 'user wants to update positions in their profile' do
    scenario 'there is a link to update positions'
    scenario 'there is no link to update positions if a user profile has no positions'
    scenario 'there is a form to update position(s)'
    scenario 'the form should display positions already listed in the user profile'
    scenario 'the list of positions for a user should update after the form is submitted'
  end
end
