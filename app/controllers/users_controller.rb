class UsersController < ApplicationController
  # skip_before_action :authenticate_user!

  def login_from_ext
    # Receive the email
    user_email = params[:user][:email]
    # Search this email in db
    # If exist, sign in (check devise method)
    if User.find_by(email: user_email)
      user = User.find_by(email: user_email)
      # p user
      # p user_email
      p "User found"
      sign_in(user)
      p user_signed_in?
    # Else, create the user and then sign in
    else
      p "User not found"
      p user_email
      @user = User.create(email: user_email, password: Devise.friendly_token[0, 20])
      p @user
      sign_in(@user)
      p user_signed_in?
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: { msg: 'success' } }
    end

  end

  def google_oauth2
     url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params["id_token"]}"
     response = RestClient.get(url)
     @user = User.create_user_for_google(response.parsed_response)
     tokens = @user.create_new_auth_token
     @user.save
     render json:@user
  end

end
