module AdminSite
  class UsersController < ActionController::Base
    layout 'admin_site'
    def index
      @all_users = User.all
    end
  
    def new
    end
  
    def create
      console
      @user_to_create = User.new(email:params[:email],username:params[:username],first_name:params[:first_name],last_name:params[:last_name],password:params[:password],password_confirmation:params[:password_confirmation],phone_number:params[:phone_number].split("-").join)
      if params[:avatar]
        @user_to_create.avatar.attach(params[:avatar])
      else
        @user_to_create.avatar.attach(io:File.open('app/assets/images/profil_defaut.png'),filename:'profil_defaut.png',content_type:'/image/png')
      end
      # puts @user_to_create
      if @user_to_create.save
        flash[:success] = "L'utilisateur a été créé avec succes"
        redirect_to new_admin_site_user_path
      else
        render :new
      end
    end
  
    def edit
      @user_to_edit = User.find(params[:id])
    end
  
    def update
      begin          
        @user_to_edit = User.find(params[:id])
        @user_to_edit.username = params[:username]
        @user_to_edit.last_name = params[:last_name]
        @user_to_edit.first_name = params[:first_name]
        @user_to_edit.phone_number = params[:phone_number].split("-").join

        if @user_to_edit.save && current_admin.valid_password?(params[:password])
          flash[:success] = 'L\'utilisateur a été mis à jour avec succès'
          redirect_to admin_site_users_path
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
      user_to_delete = User.find_by(id:params[:id])
      begin
        if user_to_delete
          user_to_delete.delete
          flash[:success]="L'utilisateur a bien été supprimé"
          redirect_to admin_site_users_path
        else
          raise StandardError.new("Aucun utilisateur concerné")
        end
        
      rescue StandardError => error
        flash[:error] = error
      end
    end

    def show
      @user_to_show = User.find_by(id: params[:id])
    end
    
    
  end
    
end
