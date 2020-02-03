class Subscription < ApplicationRecord
    has_many :users
    has_many :restaurants
    has_many :subscription_privilege
    belongs_to :subscription_type
end
