class HomeController < ApplicationController
  layout 'homepage'
  # before_action :authenticate_user!
  
  def index
  end

  protected
  def authenticate_user!
    redirect_to connection_index_path, :notice => 'if you want to add a notice'
  end
end
