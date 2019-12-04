class Dish < ApplicationRecord
    #relation
    belongs_to :restaurant
    belongs_to :category_dish
    belongs_to :type
    has_many :details_orders
    has_many :orders, through: :details_orders
end
