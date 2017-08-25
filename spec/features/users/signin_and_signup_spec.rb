require 'rails_helper'

RSpec.feature 'Sign in', :devise do
  scenario 'a user cannot sign in if not registered' do
    signin('test@example.com', 'please123')
    expect(page).to have_content (/#{I18n.t('devise.failure.not_found_in_database', authentication_keys: 'email')}/i)
  end

  scenario 'a user can sign in with valid credentials' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario 'a user cannot sign in with a wrong email' do
    user = FactoryGirl.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_content (/#{I18n.t('devise.failure.not_found_in_database', authentication_keys: 'email')}/i)
  end

  scenario 'a user cannot sign in with wrong password' do
    user = FactoryGirl.create(:user)
    signin(user.email, 'invalidpass')
    expect(page).to have_content (/#{I18n.t('devise.failure.not_found_in_database', authentication_keys: 'email')}/i)
  end
end

RSpec.feature 'Sign up', :devise do
  scenario 'a user cannot sign up if already registerd'
  scenario 'a user can sign up with valid credentials' do
    user = FactoryGirl.build(:user)
    signup(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end
  scenario 'a user cannot sign up without an email'
  scenario 'a user cannot sign up without a unique email'
  scenario 'a user cannot sign up without a valid password'
end
