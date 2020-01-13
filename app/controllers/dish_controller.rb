class DishController < ApplicationController
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
end
