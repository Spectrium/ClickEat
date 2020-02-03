class SubscriptionTypeController < ApplicationController
    def show
        @type = SubscriptionType.find(params[:id])
        @subs = @type.subscriptions
    end
end
