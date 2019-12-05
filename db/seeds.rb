# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories des Specialités de restaurant
categories = ["Malagasy","Asiatique","Indienne","Européenne","Américaine","Fast-food","Autres"]

for index in 0..6 do
Category.create(name: categories[index])
end

#Specialités des restaurants
asiatique = ["Chinoise","Japonaise","Coréenne","Thaïlandaise","Vietnamienne","Asiatique"]
europeen = ["Française","Italienne","Turque","Européenne"]
americaine = ["Grillade","Mexicaine","Americaine"]
autres = ["Fruit de mer","Boulangerie","Coffee Shop"]

Speciality.create(name: "Malagasy", category_id: 1)

for index in 0..5 do
    Speciality.create(name: asiatique[index], category_id: 2)
end

Speciality.create(name: "Indienne", category_id: 3)

for index in 0..3 do
    Speciality.create(name: europeen[index], category_id: 4)
end

for index in 0..2 do
    Speciality.create(name: americaine[index], category_id: 5)
end

Speciality.create(name: "Fast-food", category_id: 6)

for index in 0..2 do
    Speciality.create(name: autres[index], category_id: 7)
end

#Types des plats
type = ["Boissons","Desserts et douceurs","Entrée et Fast-food", "Plats chaudes"]

for index in 0..3 do
    Type.create(name: type[index])
end
#Categories des plats
boissons = ["Alcoolisés","Non-Alcoolisés","Autres"]
dd = ["Glaces","Gâteaux","Pains et Viennoiseries","Douceurs","Autres"]
ef =["Salade","Burger","Sandwich","Kebab","Poulet et nuggets","Frites","Pizza","Snack","Autres"]
hot = ["Soupe","Pâte","Halal","Seafood","Viandes","Végétariens","Autres"]


for index in 0..1 do
    CategoryDish.create(name: boissons[index], type_id: 1)
end

for index in 0..3 do
    CategoryDish.create(name: dd[index], type_id: 2)
end

for index in 0..8 do
    CategoryDish.create(name: ef[index], type_id: 3)
end

for index in 0..6 do
    CategoryDish.create(name: hot[index], type_id: 4)
end