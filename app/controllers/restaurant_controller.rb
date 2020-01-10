class RestaurantController < ApplicationController
    def index
         @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        @dishes = @restaurant.dishes
    end

    def upvote
        @restaurant = Restaurant.find(params[:id])
        @restaurant.upvote_by current_user
        redirect_back(fallback_location: "restaurant/#{@restaurant.id}")
    end

    def downvote
        @restaurant = Restaurant.find(params[:id])
        @restaurant.downvote_by current_user
        redirect_back(fallback_location: "restaurant/#{@restaurant.id}")
    end
end
