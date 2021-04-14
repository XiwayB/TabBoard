class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  # def login_from_ext
  #   redirect_to user_google_oauth2_omniauth_authorize_path
  # end

  # def google_oauth2
  #   url = "https://www.googleapis.com/oauth2/v3/tokeninfo"
  #    response = RestClient.get(url)
  #    @user = User.create_user_for_google(response.parsed_response)
  #    tokens = @user.create_new_auth_token
  #    @user.save
  #    render json:@user
  # end
end
