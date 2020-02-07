module AdminSite
  class OrderStatesController < ApplicationController
    before_action :secure
    layout 'admin_site'

    def index
      if current_admin.type_admin_id == 1
        @all_items = LineItem.where(done:true) 
      else
        @all_items = LineItem.where(done:true).select{|line_item| line_item.dish.restaurant.id == current_admin.restaurant.id }
      end
    end

    def edit
    end

    def update
      @line_item = LineItem.find(params[:id])
      new_state_payed = @line_item.payed
      @line_item.update(payed:!new_state_payed)
      respond_to do |format|
        format.js {  }
      end
    end

    private
      def secure
        if !current_admin
          redirect_to new_admin_session_path
        end
      end
  end

end