module AdminSite
  class DashboardsController < AdminSiteController
    before_action :secure

    def index
      @line_item_payed = LineItem.where(payed:true)
      if current_admin.type_admin_id == 1
        @line_item_not_confirmed = LineItem.where(received:false).count
        @turn_over = turn_over(@line_item_payed)
      else
        @turn_over = turn_over_restaurant(@line_item_payed)
        line_items_waiting = LineItem.where(received:false)
        @line_item_not_confirmed = line_item_not_confirmed(line_items_waiting).size
      end
    end

    private
    def secure
      if !current_admin
        redirect_to new_admin_session_path
      end
    end

    def turn_over(line_items)
      result = 0
      line_items.each do |line_item|
        result += line_item.amount.to_f
      end
      return result
    end

    def line_item_of_restaurant(line_items)
      result = []
      line_items.each do |line_item|
          if line_item.dish.restaurant.id == current_admin.restaurant.id
            result.push(line_item)
          end
      end
      return result
    end

    def turn_over_restaurant(line_items) 
      result = 0
      items = line_item_of_restaurant(line_items)
      items.each do |item|
        result+= item.quantity * item.dish.price
      end
      return result
    end

    def line_item_not_confirmed(line_items)
      result = []
      line_items.each do |item|
          if item.dish.restaurant.id == current_admin.restaurant.id
            result.push(item)
          end
      end
      return result
    end

  end
end