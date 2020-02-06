class AdminSite::TypeAdminsController < ApplicationController
  before_action :set_admin_site_type_admin, only: [:show, :edit, :update, :destroy]
  layout 'admin_site'
  before_action :secure
  # GET /admin_site/type_admins
  # GET /admin_site/type_admins.json
  def index
    @admin_site_type_admins = TypeAdmin.all
  end

  # GET /admin_site/type_admins/1
  # GET /admin_site/type_admins/1.json
  def show
  end

  # GET /admin_site/type_admins/new
  def new
    @admin_site_type_admin = TypeAdmin.new
  end

  # GET /admin_site/type_admins/1/edit
  def edit
  end

  # POST /admin_site/type_admins
  # POST /admin_site/type_admins.json
  def create
    begin
      @admin_site_type_admin = TypeAdmin.new(admin_site_type_admin_params)
      respond_to do |format|
        if current_admin.valid_password?(admin_site_type_admin_password_params)
          if @admin_site_type_admin.save
            format.html { 
              flash[:success] = "Type d'admin créé avec succès"
              redirect_to @admin_site_type_admin 
            }
            format.json { render :show, status: :created, location: @admin_site_type_admin }
          else
            format.html { 
              flash[:error] = "Il y a un erreur lors de la création d'un type d'admin"
              render :new 
              }
            format.json { render json: @admin_site_type_admin.errors, status: :unprocessable_entity }
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

  # PATCH/PUT /admin_site/type_admins/1
  # PATCH/PUT /admin_site/type_admins/1.json
  def update
    begin
      respond_to do |format|
        if current_admin.valid_password?(admin_site_type_admin_password_params)
          if @admin_site_type_admin.update(admin_site_type_admin_params)
            format.html { 
              flash[:success] = "Type admin mis à jour avec succès"
              redirect_to admin_site_type_admins_path
            }
            format.json { render :show, status: :ok, location: @admin_site_type_admin }
          else
            format.html {
              flash[:error] = "Il y a un erreur lors de la mise à jour d'un type d'admin"
              render :edit 
            }
            format.json { render json: @admin_site_type_admin.errors, status: :unprocessable_entity }
          end
        else
          raise StandardError.new("Vous n'êtes pas administrateur")
        end
      end
    rescue StandardError => error
      flash[:error] = error
      render :edit
    end
  end

  # DELETE /admin_site/type_admins/1
  # DELETE /admin_site/type_admins/1.json
  def destroy
    @admin_site_type_admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_site_type_admins_url, notice: 'Type admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_site_type_admin
      @admin_site_type_admin = TypeAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_site_type_admin_params
      params.require(:admin_site_type_admin).permit(:name)
    end

    def admin_site_type_admin_password_params
      params[:admin_site_type_admin][:password]
    end

    def secure
      if !current_admin || current_admin.type_admin_id != 1
        redirect_to new_admin_session_path
      end
    end
end
