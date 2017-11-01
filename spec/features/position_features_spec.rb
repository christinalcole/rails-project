require 'rails_helper'

RSpec.feature 'Users and Positions', type: :feature do
  context 'as a logged-in user' do
    it 'has a position index page nested under a user' do
      user = create(:user)

      visit user_positions_path(user.id)
      expect(page.status_code).to eq(200)
    end
  end

  context 'user wants to manage positions on their profile' do
    scenario 'there is a link to manage positions' do
      user = create(:user)
      signin(user.email, user.password)

      visit user_positions_path(user.id)
      expect(page).to have_link("Manage Positions")
    end

    scenario 'there is no link to add position(s) if a user profile already has positions'

    scenario 'there is a form to update positions associated with user profile' do
      user = create(:user)
      signin(user.email, user.password)
      visit user_positions_path(user.id)
      click_link("Manage Positions")
      expect(page).to have_css("form#edit_user_#{user.id}")
    end

    scenario 'the form should display existing positions in the db' do
      position1 = create(:position)
      position2 = create(:position)
      user = create(:user)
      signin(user.email, user.password)
      visit edit_user_path(user.id)

      expect(page).to have_content(position1.name)
      expect(page).to have_content(position2.name)
    end

    scenario 'the form should display positions already listed in the user profile'

    scenario 'the list of positions for a user should update after the form is submitted' do
      # position1 = create(:position)
      # position2 = create(:position)
      # user = create(:user)
      # signin(user.email, user.password)
      # visit new_user_position_path(user.id)
      #
      # page.check(position1.name)
      # click_button("Create Position")
      #
      # expect(user.positions).to include(position1)
    end
  end
end
