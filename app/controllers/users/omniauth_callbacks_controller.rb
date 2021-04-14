class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in @user
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { msg: 'Success', user: @user} }
      end
      # sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      # set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    # else
    #   session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
    #   redirect_to new_user_registration_url
    end
  end
  def failure
    respond_to do |format|
      format.html { redirect_to new_user_session_path }
      format.json { render json: { msg: 'Sign up failed'}}
      end
  end
end
