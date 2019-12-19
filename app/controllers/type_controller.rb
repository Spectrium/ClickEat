class TypeController < ApplicationController
    def show
       @type = Type.find(params[:id])
       @category = @type.category_dishes
    end    
end
