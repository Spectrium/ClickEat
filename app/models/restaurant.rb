class Restaurant < ApplicationRecord
    #relation
    has_many :resto_specialities
    has_many :specialities, through: :resto_specialities
    has_many :dishes
    belongs_to :subscription
    acts_as_votable
end