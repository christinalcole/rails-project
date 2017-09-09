require 'rails_helper'

RSpec.feature "User Management" type: :feature do
  scenario "user can view a list of positions add to their account" do
      @user = FactoryGirl.create(:user_with_positions)

      visit user_path(@user)
      expect(page).to have_content(@user.skills[0].name)
      expect(page).to have_content(@user.skills[1].name)
    end

  end
end
