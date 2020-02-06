class SpecialityController < ApplicationController
    def show
        @speciality = Speciality.find(params[:id])
        @category = @speciality.category
        @specialities = @category.specialities
        @categories = Category.all
    end
end
