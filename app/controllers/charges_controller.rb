class ChargesController < ApplicationController
  layout "homepage"
    def new
      @subscription = Subscription.find(session[:subscription_id])
    end
    
    def create
      @subscription = Subscription.find(session[:subscription_id])
      @amount = @subscription.price.to_i
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'mga',
      })
      session[:subscription_id] = nil
      flash[:success] = "Bravo, tu t'es inscrit avec succès"
      redirect_to root_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
