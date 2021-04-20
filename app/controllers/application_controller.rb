class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :unsaved_tabs

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def unsaved_tabs
    @unsaved_tabs = Tab.joins(:folder).where(:folders => {name:'Default'})
  end

end
