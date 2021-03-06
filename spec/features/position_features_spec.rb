require 'rails_helper'

RSpec.feature 'Users and Positions', type: :feature do
  context 'as a logged-in user' do
    it 'has a position index page nested under a user' do
      user = create(:user)

      visit user_positions_path(user.id)

      expect(page.status_code).to eq(200)
    end
  end

  xcontext 'user wants to add positions to their profile' do
    scenario 'there is a link to add new positions' do
      user = create(:user)
      signin(user.email, user.password)

      visit user_positions_path(user.id)

      expect(page).to have_link("Add Positions")
    end

    scenario 'there is a form to add new positions to the current user profile' do
      user = create(:user)
      signin(user.email, user.password)

      visit user_positions_path(user.id)
      click_link("Add Positions")

      expect(page).to have_css("form#new_user_#{user.id}")
    end

    scenario 'the form should display the existing positions in the db' do
      position1 = create(:position)
      position2 = create(:position)
      user = create(:user)

      signin(user.email, user.password)
      visit new_user_position_path(user.id)

      expect(page).to have_content(position1.name)
      expect(page).to have_content(position2.name)
    end

    scenario 'the form should allow entry of a skill level for each position'
    scenario 'the positions in the current user profile should change after form submission'
  end

  context 'user wants to manage positions on their profile' do
    scenario 'there is a link to manage positions' do
      user = create(:user)
      signin(user.email, user.password)

      visit user_positions_path(user.id)

      expect(page).to have_link("Manage Positions")
    end

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
      visit user_position_management_path(user.id)

      expect(page).to have_content(position1.name)
      expect(page).to have_content(position2.name)
    end

    scenario 'the form should display checkboxes for the existing positions in the db' do
      position1 = create(:position)
      position2 = create(:position)
      user = create(:user)

      signin(user.email, user.password)
      visit user_position_management_path(user.id)

      expect(page).to have_css("input[type=\"checkbox\"]", count: 2)
    end

    scenario 'the form should indicate which position(s) are already listed in the user profile' do
      position1 = create(:position)
      position2 = create(:position)
      user = create(:user)
      user.positions << position1

      signin(user.email, user.password)
      visit user_position_management_path(user.id)

      expect(page).to have_field("position_#{position1.id}", checked: true)
      expect(page).to have_field("position_#{position2.id}", checked: false)
    end

    scenario 'the list of positions for a user should update after the form is submitted' do
      position1 = create(:position)
      position2 = create(:position)
      user = create(:user)
      user.positions << position1

      signin(user.email, user.password)
      visit user_position_management_path(user.id)

      page.check(position2.name)
      click_button("Manage Position(s)")

      expect(user.positions).to include(position1, position2)
    end

    scenario 'form submission updates an existing profile position and does not create a new one' do
      position1 = create(:position)
      user = create(:user)
      user.positions_users << PositionsUser.create(user_id: user.id, position_id: position1.id, skill_level: 2)

      signin(user.email, user.password)
      visit user_position_management_path(user.id)
      fill_in 'user[positions_users_attributes][0][skill_level]', with: 5
      click_button("Manage Position(s)")

      expect(user.positions.count).to eq(1)
      expect(user.positions_users.count).to eq(1)
      expect(user.positions_users.first.skill_level).to eq(5)
    end
  end
end
