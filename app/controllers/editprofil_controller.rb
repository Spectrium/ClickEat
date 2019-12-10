class EditprofilController < ActionController::Base
  layout "profils"
  def edit
    if current_user
      @user = User.find_by(id: current_user.id)
    else
      redirect_to "connection/index"
    end

  end

  def index
    
  end

  def password
    
  end

  def info
    
  end
end
