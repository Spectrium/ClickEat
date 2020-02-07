class CategoryController < ApplicationController
    layout 'homepage'
    def index
        @category = Category.all
    end    
    
    def show
       @category = Category.find(params[:id])
       @speciality = @category.specialities
       @categories = Category.all
    end
end
