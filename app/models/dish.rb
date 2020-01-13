class Dish < ApplicationRecord
    paginates_per 8
    #relation
    belongs_to :restaurant
    belongs_to :category_dish
    has_many :details_orders
    has_many :orders, through: :details_orders
    acts_as_votable
end
