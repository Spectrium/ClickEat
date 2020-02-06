module ApplicationHelper
    def resource_name
        :user
    end
    
    def resource
      @user ||= User.new
    end
    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
   
    def nombre_quantity_product
      nbr = 0
      for index_product in 0 ... session[:product_id].size do
        nbr += session[:quantity][index_product]
      end
      return nbr
    end
end
