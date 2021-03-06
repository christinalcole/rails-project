class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #throws error is @user isn't activiated; otherwise triggers after_authentication callbacks
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      flash[:notice] = "You're almost done! Please fill in the missing values to complete your sign-up."
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
