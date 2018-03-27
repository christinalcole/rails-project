require 'rails_helper'

RSpec.feature 'Sign in', :devise do
  scenario 'a user cannot sign in if not registered' do
    signin('test@example.com', 'please123')
    expect(page).to have_content (/#{I18n.t('devise.failure.not_found_in_database', authentication_keys: 'email')}/i)
  end

  scenario 'a user can sign in with valid credentials' do
    user = FactoryBot.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario 'a user cannot sign in with a wrong email' do
    user = FactoryBot.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_content (/#{I18n.t('devise.failure.not_found_in_database', authentication_keys: 'email')}/i)
  end

  scenario 'a user cannot sign in with wrong password' do
    user = FactoryBot.create(:user)
    signin(user.email, 'invalidpass')
    expect(page).to have_content (/#{I18n.t('devise.failure.not_found_in_database', authentication_keys: 'email')}/i)
  end
end

RSpec.feature 'Sign up', :devise do
  scenario 'a user cannot sign up if already registered'

  scenario 'a user can sign up with valid credentials' do
    user = FactoryBot.build(:user)
    signup(user.first_name, user.last_name, user.phone_number, user.weight, user.email, user.password)
    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end

  scenario 'a user cannot sign up without an email' do
    user = FactoryBot.build(:user)
    signup(user.first_name, user.last_name, user.phone_number, user.weight, "", user.password)
    expect(page).to have_content "Email can't be blank"
  end

  scenario 'a user cannot sign up without a unique email' do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    signup(user2.first_name, user2.last_name, user2.phone_number, user2.weight, user.email, user2.password)
    expect(page).to have_content "Email has already been taken"
  end

  scenario 'a user cannot sign up without a valid password' do
    user = FactoryBot.build(:user)
    signup(user.first_name, user.last_name, user.phone_number, user.weight, user.email, "meh")
    expect(page).to have_content "Password is too short"
  end
end
