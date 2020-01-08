class TestController < ApplicationController
  def index
    @type = Type.all
  end

  def show
  end

  def tableau
  end	
end
