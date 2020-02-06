module AdminSite
  class DashboardsController < AdminSiteController
    before_action :secure

    def index
      @orders_payed = Order.where(payed:true)
      if current_admin.type_admin_id == 1
        @orders_not_confirmed = Order.where(confirmed:false).count
        @turn_over = turn_over(@orders_payed)
      else
        @turn_over = turn_over_restaurant(@orders_payed)
        orders_waiting = Order.where(confirmed:false)
        @orders_not_confirmed = order_not_confirmed(orders_waiting).size
      end
    end

    private
    def secure
      if !current_admin
        redirect_to new_admin_session_path
      end
    end

    def turn_over(orders)
      result = 0
      orders.each do |order|
        result += order.amount.to_f
      end
      return result
    end

    def line_item_of_restaurant(orders)
      result = []
      orders.each do |order|
        order.order_details.each do |order_detail|
          if order_detail.line_item.dish.restaurant.id == current_admin.restaurant.id
            result.push(order_detail.line_item)
          end
        end
      end
      return result
    end

    def turn_over_restaurant(orders) 
      result = 0
      items = line_item_of_restaurant(orders)
      items.each do |item|
        result+= item.quantity * item.dish.price
      end
      return result
    end

    def order_not_confirmed(orders)
      result = []
      orders.each do |order|
        order.order_details.each do |order_detail|
          if order_detail.line_item.dish.restaurant.id == current_admin.restaurant.id
            result.push(order_detail)
          end
        end
      end
      return result
    end

  end
end