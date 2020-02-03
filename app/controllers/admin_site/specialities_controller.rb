class AdminSite::SpecialitiesController < ApplicationController
  before_action :set_speciality, only: [:edit, :update, :show, :destroy]
  layout 'admin_site'
  include(AdminSiteHelper)
  def index
    @specialities = Speciality.all
  end

  def new
    @speciality = Speciality.new
  end

  def create
    begin
      @speciality = Speciality.new(speciality_params)
      respond_to do |format|
        if current_admin.valid_password?(speciality_password_params)
          if @speciality.save
            format.html {
              flash[:success] = "Spécialité créée avec succès"
              redirect_to admin_site_specialities_path
            }
            format.json {
              render :show, status: :created, location: @speciality
            }
          else
            format.html {
              flash[:error] = "Il y a un erreur lors de la création d'une spécialité"
              render :new
            }
            format.json { render json: @speciality.errors, status: :unprocessable_entity }
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
        if current_admin.valid_password?(speciality_password_params)
          if @speciality.update(speciality_params)
            format.html {
              flash[:success] = "Spécialité a été mise à jour avec succès"
              redirect_to admin_site_specialities_path
            }
            format.json {
              render :show, status: :created, location: @speciality
            }
          else
            format.html {
              flash[:error] = "Il y a un erreur lors de la mise à jour de dpécialité"
              render :new 
            }
            format.json { render json: @speciality.errors, status: :unprocessable_entity }
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

  def show
  end

  def destroy
    @speciality.destroy
      respond_to do |format|
        format.html {
          flash[:success] = 'Spécialité a été supprimé avec succès'
          redirect_to admin_site_specialities_path 
        }
        format.json { head :no_content }
      end
  end

  private

    def speciality_params
      params.require(:speciality).permit(:name,:category_id)
    end

    def speciality_password_params
      params[:speciality][:password]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_speciality
      @speciality = Speciality.find(params[:id])
    end
end
