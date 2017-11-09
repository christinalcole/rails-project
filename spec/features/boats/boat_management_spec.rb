require 'rails_helper'

RSpec.feature 'Boats Management', type: :feature do
  context 'nested routes' do
    scenario 'the index page of all boats belonging to a user is nested under the user' do
      user = create(:user)
      visit user_boats_path(user.id)

      expect(page.status_code).to eq(200)
    end
    scenario 'the show page of a specific boat belonging to a user is nested under the user' do
      user = create(:user)
      boat = create(:boat)
      visit user_boat_path(user.id, boat.id)

      expect(page.status_code).to eq(200)
    end
    scenario 'the edit page of a specific boat belonging to a user is nested under the user' do
      user = create(:user)
      boat = create(:boat)
      visit edit_user_boat_path(user.id, boat.id)

      expect(page.status_code).to eq(200)
    end
    scenario 'the page to add a new boat to a user is nested under the user' do
      user = create(:user)
      boat = create(:boat)
      visit new_user_boat_path(user.id)

      expect(page.status_code).to eq(200)
    end
  end

  context 'standard routes' do
    scenario 'a show page for a specific boat in the db exists' do
      boat = create(:boat)
      visit boat_path(boat.id)

      expect(page.status_code).to eq(200)
    end
    scenario 'an index page of all boats in the db exists' do
      visit boats_path

      expect(page.status_code).to eq(200)
    end
    scenario 'a page to add a new boat that is not nested under the current user does not exist' 
    scenario 'a page to edit a specific boat that is not nested under the current user does not exist'
  end

  context 'create boats' do
    scenario 'a form exists to add a new boat to the db' do
      visit new_boat_path
      expect(page).to have_css('form#new_boat')
    end
    scenario 'a new boat is created when the form is submitted' do
      visit new_boat_path
      fill_in 'boat[name]', with: 'Sea Witch'
      click_button 'Create Boat'

      expect(Boat.last.name).to eq("Sea Witch")
      expect(page).to have_content("Sea Witch")
    end
  end

  context 'editing boats' do
    scenario 'an existing boat can be updated' do
      boat = FactoryGirl.create(:boat, name: "Feelin Good")

      vist edit_boat_path(boat.id)
      expect(page).to have_css("form#edit_boat_#{boat.id}")

      fill_in 'boat[name]', with: 'Feline Good'
      click_button 'Update Boat'

      expect(Boat.first.name).to eq("Feline Good")
      expect(page).to have_content("Feline Good")
    end

    scenario 'an existing boat can be removed' do
      boat = FactoryGirl.create(:boat)

      visit boats_path
      click_link "Delete"

      expect(Boat.count).to eq(0)
      expect(current_path).to eq(boats_path)
    end
  end

  context 'listing boats' do
    scenario 'existing boats in the database can be listed' do
      boat1 = FactoryGirl.create(:boat)
      boat2 = FactoryGirl.create(:boat)

      visit boats_path
      expect(page).to have_content("#{boat1.name}")
      expect(page).to have_content("#{boat2.name}")
    end
  end
end
