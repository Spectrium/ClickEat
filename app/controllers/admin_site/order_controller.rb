module AdminSite
  class OrderController < ActionController::Base
    def index
      @orders = Order.where(confirmed:false)
    end
  end
end