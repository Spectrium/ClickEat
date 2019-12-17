module AdminSite
  class UsersController < ActionController::Base
    layout 'admin_site'
    def index
      @all_users = User.all
    end
  
    def new
    end
  
    def create
    end
  
    def edit
    end
  
    def update
    end
  end
    
end
