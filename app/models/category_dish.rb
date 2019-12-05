class CategoryDish < ApplicationRecord
    #relation
    has_many :dishes
    belongs_to :type
end
