class CategoryDishController < ApplicationController
    layout 'homepage'
    def show
        @category = CategoryDish.find(params[:id])
        @type = @category.type
        @categories = @type.category_dishes
        @types = Type.all
        # duplicate_dish_in_cart
    end
end
