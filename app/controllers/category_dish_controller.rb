class CategoryDishController < ApplicationController
    def show
        @category = CategoryDish.find(params[:id])
        @type = @category.type
        @categories = @type.category_dishes
        @types = Type.all
    end
end
