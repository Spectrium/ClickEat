module AdminSite
  class DishesController < ActionController::Base
    before_action :set_dish, only: [:edit, :update, :show, :destroy]
    layout 'admin_site'
    include(AdminSiteHelper)

    def index
      @dishes = Dish.all
    end
  
    def new
      @dish = Dish.new
    end
  
    def create
      begin
        @dish = Dish.new(dish_params)
        respond_to do |format|
          if current_admin.valid_password?(dish_password_params)
            if @dish.save
              format.html {
                flash[:success] = "Plat créée avec succès"
                redirect_to admin_site_dishes_path
              }
              format.json {
                render :show, status: :created, location: @dish
              }
            else
              format.html {
                flash[:error] = "Il y a un erreur lors de la création d'un plat"
                render :new
              }
              format.json { render json: @dish.errors, status: :unprocessable_entity }
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
          if current_admin.valid_password?(dish_password_params)
            if @dish.update(dish_params)
              format.html {
                flash[:success] = "Plat mise à jour avec succès"
                redirect_to admin_site_type_admins_path
              }
              format.json {
                render :show, status: :created, location: @type
              }
            else
              format.html {
                flash[:error] = "Il y a un erreur lors de la mise à jour de catégorie de plat"
                render :new 
              }
              format.json { render json: @dish.errors, status: :unprocessable_entity }
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
      @dish.destroy
      respond_to do |format|
        format.html {
          flash[:success] = 'Un Plat a été supprimé avec succès'
          redirect_to admin_site_dishes_path
        }
        format.json { head :no_content }
      end
    end

    def show
    end
  
    private
  
    def dish_params
      params.require(:dish).permit(:name, :description, :price, :preparation_time,:restaurant_id,:category_dish_id)
    end
    
  
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end
  
    def dish_password_params
      params[:dish][:password]
    end
    
  end
    
end
