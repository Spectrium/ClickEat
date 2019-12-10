class DetailsOrder < ApplicationRecord
    #relation
    belongs_to :dish
    belongs_to :order
end
