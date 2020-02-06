module AdminSite
  class DishesController < ActionController::Base
    before_action :set_dish, only: [:edit, :update, :show, :destroy]
    before_action :secure
    layout 'admin_site'
    include(AdminSiteHelper)

    def index
      if current_admin.type_admin_id != 1
        @dishes = current_admin.restaurant.dishes
      else
        @dishes = Dish.all
      end
    end
  
    def new
      @dish = Dish.new
      session[:restaurant_id] = current_admin.restaurant.id
    end
  
    def create
      begin
        @dish = Dish.new(dish_params)
        if current_admin.type_admin_id != 1
          @dish.restaurant_id = session[:restaurant_id]
        end
        respond_to do |format|
          if current_admin.valid_password?(dish_password_params)
            if @dish.save
              format.html {
                flash[:success] = "Plat créée avec succès"
                session[:restaurant_id] = nil
                redirect_to admin_site_dishes_path
              }
              format.json {
                render :show, status: :created, location: @dish
              }
            else
              format.html {
                session[:restaurant_id] = nil
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
        session[:restaurant_id] = nil
        flash[:error] = error
        render :new
      end
    end
  
    def edit
      session[:restaurant_id] = current_admin.restaurant.id
    end
  
    def update
      begin
        respond_to do |format|
          if current_admin.valid_password?(dish_password_params)
            if current_admin.type_admin_id != 1
              @dish.restaurant_id = session[:restaurant_id].to_i
            end
            if @dish.update(dish_params)
              format.html {
                session[:restaurant_id] = nil
                flash[:success] = "Plat mise à jour avec succès"
                redirect_to admin_site_dishes_path
              }
              format.json {
                render :show, status: :created, location: @type
              }
            else
              format.html {
                session[:restaurant_id] = nil
                flash[:error] = "Il y a un erreur lors de la mise à jour de catégorie de plat"
                render :new 
              }
              format.json { render json: @dish.errors, status: :unprocessable_entity }
            end
          else
            session[:restaurant_id] = nil
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
      if current_admin.type_admin_id != 1
        return params.require(:dish).permit(:name, :description, :price, :preparation_time,:category_dish_id)
      end
      return params.require(:dish).permit(:name, :description, :price, :preparation_time,:restaurant_id,:category_dish_id)
    end
    
  
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end
  
    def dish_password_params
      params[:dish][:password]
    end

    def secure
      if !current_admin
        redirect_to new_admin_session_path
      end
    end
    
  end
    
end
