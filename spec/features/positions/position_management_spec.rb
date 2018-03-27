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
    scenario 'an existing position can be updated' do
      position = create(:position, name: "gib trim")

      visit edit_position_path(position.id)
      expect(page).to have_css("form#edit_position_#{position.id}")

      fill_in 'position[name]', with: 'Jib Trim'
      click_button 'Update Position'

      expect(Position.first.name).to eq("Jib Trim")
      expect(page).to have_content("Jib Trim")
    end


    scenario 'an existing position can be removed' do
      position = create(:position)

      visit positions_path
      click_link "Delete"

      expect(Position.count).to eq(0)
      expect(current_path).to eq(positions_path)
    end
  end

  context 'listing positions' do
    scenario 'existing positions in the database can be listed' do
      position1 = create(:position)
      position2 = create(:position)

      visit positions_path
      expect(page).to have_content("#{position1.name}")
      expect(page).to have_content("#{position2.name}")
    end
  end
end
