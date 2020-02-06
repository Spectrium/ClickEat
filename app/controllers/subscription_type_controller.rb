class SubscriptionTypeController < ApplicationController
    layout 'homepage'
    def show
        @type = SubscriptionType.find(params[:id])
        @subs = @type.subscriptions
    end
end
