module Features
    module SessionHelpers
      def signin(email, password)
        visit new_user_session_path
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        click_button 'Log in'
      end

      def signup(first_name, last_name, phone_number, weight, email, password)
        visit new_user_registration_path
        fill_in 'First name', with: first_name
        fill_in 'Last name', with: last_name
        fill_in 'Phone number', with: phone_number
        fill_in 'Weight', with: weight
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password
        click_button 'Sign up'
      end

      def stub_omniauth
        OmniAuth.config.test_mode = true #sets OmniAuth to run in test model
        OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
            provider: 'facebook',
            uid: '1234567',
            info: {
              email: 'barnaclebill@davyjones.com',
              name: 'Barnacle Bill',
              first_name: 'Barnacle',
              last_name: 'Bill',
              verified: true
            },
            credentials: {
              token: 'ABCDEFGHIJKLMNO',
              expires_at: DateTime.now,
              expires: true
            }
          })
        end
    end
  end
