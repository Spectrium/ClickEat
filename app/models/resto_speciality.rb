class RestoSpeciality < ApplicationRecord
    #relation
    belongs_to :restaurant
    belongs_to :speciality
end