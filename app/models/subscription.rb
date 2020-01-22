class Subscription < ApplicationRecord
    has_many :users
    has_many :restaurants
    belongs_to :subscription_type
end
