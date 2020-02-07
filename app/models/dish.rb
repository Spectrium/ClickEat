class Dish < ApplicationRecord
    paginates_per 8
    #relation
    has_one_attached :image
    belongs_to :restaurant
    belongs_to :category_dish
    acts_as_votable
    has_many :line_items, dependent: :destroy
end
