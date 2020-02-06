class DishController < ApplicationController
    layout 'homepage'
    def index
        @dishes = Dish.order(:name).page(params[:page])   
    end

    def show
        @dish = Dish.find(params[:id])
    end

    def upvote
        @dish = Dish.find(params[:id])
        @dish.upvote_by current_user
        redirect_back(fallback_location: "dish/#{@dish.id}")
    end

    def downvote
        @dish = Dish.find(params[:id])
        @dish.downvote_by current_user
        redirect_back(fallback_location: "dish/#{@dish.id}")
    end

    # def added_to_cart
    #     @dish = Dish.find(params[:id])
    #     @old_product_number = nombre_quantity_product
    #     duplicate_dish_in_cart(@dish)
    #     @new_product_number = nombre_quantity_product
    #     respond_to do |format|
    #       format.js {}
    #     end
    # end

    def show_cart
    end

    private
    # def duplicate_dish_in_cart(dish)
    #   index_product = 0
    #   if !session[:cart_id].nil?
    #     while index_product < session[:product_id].size do
    #       if session[:product_id][index_product].to_i == dish.id
    #         puts session[:quantity][index_product] 
    #         session[:quantity][index_product] = 1 + session[:quantity][index_product].to_i
    #         puts session[:quantity][index_product]
    #         index_product+=1
    #         return session[:product_id][index_product].to_i
    #       end
    #     end
    #     if session[:product_id].size == 0
    #       session[:product_id] << @dish.id
    #       session[:product_name] << @dish.name
    #       session[:quantity] << 1
    #       session[:price] << @dish.price
    #       return session[:product_id][index_product].to_i
    #     end
    #     if index_product > session[:product_id].size
    #       session[:product_id] << @dish.id
    #       session[:product_name] << @dish.name
    #       session[:quantity] << 1
    #       session[:price] << @dish.price
    #       return session[:product_id][index_product].to_i
    #     end
    #   end
    # end

    # def already_exist_in_cart(dish)
    #   for index_product in 0 ... session[:product_id].size do
    #     if session[:product_id][index_product].to_i == dish.id
    #       return true
    #     end
    #   end
    #   return false
    # end

    # def nombre_quantity_product
    #   nbr = 0
    #   for index_product in 0 ... session[:product_id].size do
    #     nbr += session[:quantity][index_product]
    #   end
    #   return nbr
    # end
    
end
