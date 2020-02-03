class AdminSite::TypesController < ApplicationController
  before_action :set_type, only: [:edit, :update, :show, :destroy]
  layout 'admin_site'
  include(AdminSiteHelper)

  def index
    @types = Type.all
  end

  def new
    @type = Type.new
  end

  def create
    begin
      @type = Type.new(type_params)
      respond_to do |format|
        if current_admin.valid_password?(type_password_params)
          if @type.save
            format.html {
              flash[:success] = "Type créé avec succès"
              redirect_to admin_site_types_path
            }
            format.json {
              render :show, status: :created, location: @type
            }
          else
            format.html {
              flash[:error] = "Il y a un erreur lors de la création d'un type de plat"
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
        if current_admin.valid_password?(type_password_params)
          if @type.update(type_params)
            format.html {
              flash[:success] = "Type a été mise à jour avec succès"
              redirect_to admin_site_types_path
            }
            format.json {
              render :show, status: :created, location: @type
            }
          else
            format.html {
              flash[:error] = "Il y a un erreur lors de la mise à jour de type"
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

  def destroy
    @type.destroy
    respond_to do |format|
      format.html {
        flash[:success] = 'Type a été supprimé avec succès'
        redirect_to admin_site_types_path 
      }
      format.json { head :no_content }
    end
  end

  def show
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end
  

  # Use callbacks to share common setup or constraints between actions.
  def set_type
    @type = Type.find(params[:id])
  end

  def type_password_params
    params[:type][:password]
  end
  
end
