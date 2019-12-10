class ConnectionController < ActionController::Base
  layout "connection"
  def index
    if current_user
      redirect_to "/"
    end
  end
end
