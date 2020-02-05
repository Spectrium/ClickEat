class TypeController < ApplicationController
    def index
        @type = Type.all
    end    
    
    def show
       @type = Type.find(params[:id])
       @category = @type.category_dishes
       @types = Type.all
    end    
end

