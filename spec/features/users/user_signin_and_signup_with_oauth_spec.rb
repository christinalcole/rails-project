require 'rails_helper'

RSpec.feature 'user signs up', type: :feature do
  scenario 'using facebook oauth, user is directed to sign up form to fill in missing information' do
    stub_omniauth

    visit root_path
    expect(page).to have_link("Sign up with Facebook")
    click_link ("Sign up with Facebook")

    expect(page).to have_content("You're almost done! Please fill in the missing values to complete your sign-up.")
    expect(page).to have_link("Sign up")
  end
end
