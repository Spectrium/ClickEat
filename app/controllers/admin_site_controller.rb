class AdminSiteController < ActionController::Base
  layout 'admin_site'

  def index
  end

  def authenticate_admin
    unless current_admin
      redirect_to new_admin_session_path
    end
  end

  def after_sign_in_path_for(resource)
    new_tester_path
  end
end
