class Order < ApplicationRecord
    #relation
    has_many :details_orders
    has_many :dishes, through: :details_orders
end
