module AdminSite
  class SpecialitiesCategoriesController < ActionController::Base
    before_action :set_specialities_category, only: [:edit, :update, :show, :destroy]
    layout 'admin_site'
    def index
      @specialities_categories = Category.all
    end
  
    def new
      @specialities_category = Category.new
    end

    def show
    end
    
    def create
      begin
        @specialities_category = Category.new(specialities_category_params)
        respond_to do |format|
          if current_admin.valid_password?(specialities_category_password_params) && @specialities_category.save
            if @specialities_category.save
              format.html {
                flash[:success] = "Une catégorie a été créée avec succès"
                redirect_to admin_site_specialities_categories_path
              }
              format.json {
                render :show, status: :created, location: @specialities_category
              }
            else
              format.html {
                flash[:error] = "Il y a un erreur lors de la création de categorie"
                render :new 
              }
              format.json { render json: @specialities_category.errors, status: :unprocessable_entity }
            end
          else
            raise StandardError.new("Vous n'êtes pas l'administrateur")
          end
        end
      rescue StandardError => error 
        flash[:error] = error
        render :new
      end
    end
  
    def edit
    end
  
    def update
      begin
        respond_to do |format|
          if current_admin.valid_password?(specialities_category_password_params) && @specialities_category.save
            if @specialities_category.update(specialities_category_params)
              format.html {
                flash[:success] = "Une catégorie a été mise à jour avec succès"
                redirect_to admin_site_specialities_categories_path
              }
              format.json {
                render :show, status: :created, location: @specialities_category
              }
            else
              format.html {
                flash[:error] = "Il y a un erreur lors de la mise à jour de categorie"
                render :new 
              }
              format.json { render json: @specialities_category.errors, status: :unprocessable_entity }
            end
          else
            raise StandardError.new("Vous n'êtes pas l'administrateur")
          end
        end
      rescue StandardError => error 
        flash[:error] = error
        render :new
      end
    end 

    # DELETE /specialities_category/1
    def destroy
      @specialities_category.destroy
      respond_to do |format|
        format.html {
          flash[:success] = 'Request remplacement was successfully destroyed.'
          redirect_to admin_site_specialities_categories_url 
        }
        format.json { head :no_content }
      end
    end
    
    private

    def specialities_category_params
      params.require(:category).permit(:name)
    end

    def specialities_category_password_params
      params[:category][:password]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_specialities_category
      @specialities_category = Category.find(params[:id])
    end
    
    
  end
end
