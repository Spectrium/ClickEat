class TypeController < ApplicationController
    layout 'homepage'
    def show
       @type = Type.find(params[:id])
       @category = @type.category_dishes
       @types = Type.all
    end    
end
