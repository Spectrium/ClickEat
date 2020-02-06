module AdminSite
  class DashboardsController < AdminSiteController
    before_action :secure

    def index
    end

    private
    def secure
      if !current_admin
        redirect_to new_admin_session_path
      end
    end
  end
end