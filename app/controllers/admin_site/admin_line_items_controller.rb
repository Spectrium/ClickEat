module AdminSite
  class AdminLineItemsController < ApplicationController
    layout 'admin_site'
    def index
      if session[:line_item_order]
        session.delete(:line_item_order)
      end
      if session[:annulation_line_item_order]
        session.delete(:annulation_line_item_order)
      end
      if current_admin.type_admin_id != 1 
        @line_items = LineItem.where(received:false, canceled:false).select{|line_item| line_item.dish.restaurant.id == current_admin.restaurant.id }
      else
        @line_items = LineItem.where(received:false)
      end
    end

    def show
      if session[:annulation_line_item_order]
        session.delete(:annulation_line_item_order)
      end
      if session[:line_item_order]
        session.delete(:line_item_order)
      end
    end

    def edit
      if session[:annulation_line_item_order]
        session.delete(:annulation_line_item_order)
      end
      if session[:line_item_order]
        session.delete(:line_item_order)
      end
      @line_item = LineItem.find(params[:id])
    end

    def update
      if session[:annulation_line_item_order]
        session.delete(:annulation_line_item_order)
      end
      @line_item = LineItem.find(params[:id])
      if @line_item.update(received:session[:line_item_order])
        flash[:success] = "La commande #{@line_item.dish.name} est reçu"
        redirect_to admin_site_admin_line_items_path
      end
    end

    def cancel
      @line_item = LineItem.find(params[:id])
      if @line_item.update(canceled:session[:annulation_line_item_order])
        flash[:error] = "La commande #{@line_item.dish.name} a été annulé"
        redirect_to admin_site_admin_line_items_path
      end
    end
    
  end
end