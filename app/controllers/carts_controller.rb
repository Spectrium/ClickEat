class CartsController < ApplicationController
  include(CartsHelper)
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  def add_to_order
    ActiveRecord::Base.transaction do
      current_order = Order.create(confirmed: false, payed: false)
      current_cart.line_items.each do |item|
        OrderDetail.create(line_item:item, order:current_order)
      end
      cart_release
    end
  end

  private
  def cart_release
    current_cart.line_items.each do |item|
      # item.delete
      LineItem.update(item.id, done:true)
    end
  end
end
