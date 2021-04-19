class ApplicationController < ActionController::Base
  # Prevent CSRF attacks, except for JSON requests (API clients)
  protect_from_forgery unless: -> { request.format.json? }

  # Require authentication and do not set a session cookie for JSON requests (API clients)
  before_action :authenticate_user!, :do_not_set_cookie, if: -> { request.format.json? }

  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  # Do not generate a session or session ID cookie
  # See https://github.com/rack/rack/blob/master/lib/rack/session/abstract/id.rb#L171
  def do_not_set_cookie
    request.session_options[:skip] = true
  end

end
