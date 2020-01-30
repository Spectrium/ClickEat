module AdminSite
  class RestaurantsController < ActionController::Base
    layout 'admin_site'
    def index
      @all_restaurants = Restaurant.all
    end
  
    def new
    end
  
    def create
      @restaurant_to_create = Restaurant.new(name:params[:name_of_restaurant],location:params[:location],description:params[:description],email:params[:email],phone_number:params[:phone_number].split("-").join)
      if params[:logo]
        @restaurant_to_create.logo.attach(params[:logo])
      end
      if params[:picture_restaurant]
        @restaurant_to_create.picture.attach(params[:logo])
      end
      q
      # puts @user_to_create
      if @restaurant_to_create.save
        flash[:success] = "Le restaurant a été créé avec succes"
        redirect_to new_admin_site_restaurant_path
      else
        flash[:error] = "Il y a un probleme lors de la creation"
        render :new
      end
    end
  
    def edit
      @restaurant_to_edit = Restaurant.find(params[:id])
    end
  
    def update
      begin          
        @restaurant_to_edit = Restaurant.find(params[:id])
        @restaurant_to_edit.name = params[:name_of_restaurant]
        @restaurant_to_edit.location = params[:location]
        @restaurant_to_edit.description = params[:description]
        @restaurant_to_edit.phone_number = params[:phone_number].split("-").join

        if @restaurant_to_edit.save && current_admin.valid_password?(params[:password])
          flash[:success] = 'L\'utilisateur a été mis à jour avec succès'
          if params[:logo]
            @restaurant_to_edit.logo.attach(params[:logo])
          end
          if params[:picture_restaurant]
            @restaurant_to_edit.picture.attach(params[:picture_restaurant])
          end
          redirect_to admin_site_restaurants_path
        else
          if !current_admin.valid_password?(params[:password])
            raise StandardError.new("Mot de passe incorrect")
          end
          render :edit
        end
      rescue StandardError => error 
        flash[:error] = error
        render :edit
      end
    end

    def destroy
      # redirect_to admin_site_users_path
      restaurant_to_delete = Restaurant.find_by(id:params[:id])
      begin
        if restaurant_to_delete
          restaurant_to_delete.delete
          flash[:success]="Le restaurant a bien été supprimé"
          redirect_to admin_site_restaurants_path
        else
          raise StandardError.new("Aucun utilisateur concerné")
        end
        
      rescue StandardError => error
        flash[:error] = error
        redirect_to admin_site_restaurants_path
      end
    end
  end
    
end
