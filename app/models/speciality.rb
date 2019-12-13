class Speciality < ApplicationRecord
    #relation
    belongs_to :category
    has_many :resto_specialities
    has_many :restaurants, through: :resto_specialities

end
