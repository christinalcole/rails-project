require 'rails_helper'

RSpec.feature 'Users and Positions', type: :feature do
  context 'as a logged-in user' do
    it 'has an add-position page nested under a user' do
      user = create(:user)
      visit new_user_position_path(user.id)
      expect(page.status_code).to eq(200)
    end
  end

  context 'user wants to add positions to their profile' do
    scenario 'there is a link to add new position(s)' do
      user = create(:user)
      signin(user.email, user.password)

      visit user_path(user.id)
      expect(page).to have_link("Add Crew Positions")
    end

    scenario 'there is no link to add position(s) if a user profile already has positions'

    scenario 'there is a form to add new position(s)' do
      user = create(:user)
      signin(user.email, user.password)
      visit user_path(user.id)
      click_link("Add Crew Positions")
      expect(page).to have_css("form#new_position")
    end

    scenario 'the form should display existing positions in the db' do
      position1 = create(:position)
      position2 = create(:position)
      user = create(:user)
      signin(user.email, user.password)
      visit new_user_position_path(user.id)

      expect(page).to have_content(position1.name)
      expect(page).to have_content(position2.name)
    end

    scenario 'the user should gain new position(s) after the form is submitted' do
      position1 = create(:position)
      position2 = create(:position)
      user = create(:user)
      signin(user.email, user.password)
      visit new_user_position_path(user.id)

      page.check(position1.name)
      click_button("Create Position")

      expect(user.positions).to include(position1)
    end
  end

  context 'user wants to update positions in their profile' do
    scenario 'there is a link to update positions'
    scenario 'there is no link to update positions if a user profile has no positions'
    scenario 'there is a form to update position(s)'
    scenario 'the form should display positions already listed in the user profile'
    scenario 'the list of positions for a user should update after the form is submitted'
  end

end
