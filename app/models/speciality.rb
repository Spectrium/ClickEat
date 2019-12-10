class Speciality < ApplicationRecord
    #relation
    has_many :resto_specialities
    has_many :restaurants, through: :resto_specialities
end
