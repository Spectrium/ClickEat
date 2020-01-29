class AdminSite::CategoryDishesController < ApplicationController
  before_action :set_category_dish, only: [:edit, :update, :show, :destroy]
  layout 'admin_site'
  include(AdminSiteHelper)

  def index
    @category_dishes = CategoryDish.all
  end

  def new
    @category_dish = CategoryDish.new
  end

  def create
    begin
      @category_dish = CategoryDish.new(category_dish_params)
      respond_to do |format|
        if current_admin.valid_password?(category_dish_password_params)
          if @category_dish.save
            format.html {
              flash[:success] = "Categorie de plat créée avec succès"
              redirect_to admin_site_category_dishes_path
            }
            format.json {
              render :show, status: :created, location: @category_dish
            }
          else
            format.html {
              flash[:error] = "Il y a un erreur lors de la création d'une catégorie de plat"
              render :new
            }
            format.json { render json: @type.errors, status: :unprocessable_entity }
          end
        else
          raise StandardError.new("Vous n'êtes pas administrateur")
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
        if current_admin.valid_password?(category_dish_password_params)
          if @category_dish.update(category_dish_params)
            format.html {
              flash[:success] = "Type a été mise à jour avec succès"
              redirect_to admin_site_category_dishes_path
            }
            format.json {
              render :show, status: :created, location: @type
            }
          else
            format.html {
              flash[:error] = "Il y a un erreur lors de la mise à jour de catégorie de plat"
              render :new 
            }
            format.json { render json: @category_dish.errors, status: :unprocessable_entity }
          end
        else
          raise StandardError.new("Vous n'êtes pas administrateur")
        end
      end
    rescue StandardError => error 
      flash[:error] = error
      render :new
    end
  end

  def destroy
    @category_dish.destroy
    respond_to do |format|
      format.html {
        flash[:success] = 'Catégorie de plat a été supprimé avec succès'
        redirect_to admin_site_category_dishes_path 
      }
      format.json { head :no_content }
    end
  end

  def show
  end

  private

  def category_dish_params
    params.require(:category_dish).permit(:name, :type_id)
  end
  

  # Use callbacks to share common setup or constraints between actions.
  def set_category_dish
    @category_dish = CategoryDish.find(params[:id])
  end

  def category_dish_password_params
    params[:category_dish][:password]
  end
end
