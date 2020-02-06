module AdminSite
  class DishesTypesController < ActionController::Base
    before_action :secure
    layout 'admin_site'
    def index
    end
  
    def new
    end
  
    def create
    end
  
    def edit
    end
  
    def update
    end

    private
    def secure
      if !current_admin || current_admin.type_admin_id != 1
        redirect_to new_admin_session_path
      end
    end
  end    
end
