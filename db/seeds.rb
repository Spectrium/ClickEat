# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories des Specialités de restaurant
categories = ["Malagasy",
    "Asiatique",
    "Indienne",
    "Européenne",
    "Américaine",
    "Fast-food",
    "Autres"
]

for index in 0..6 do
Category.create(name: categories[index])
end

#Specialités des restaurants
asiatique = ["Chinoise",
    "Japonaise",
    "Coréenne",
    "Thaïlandaise",
    "Vietnamienne",
    "Asiatique"
]
europeen = ["Française",
    "Italienne",
    "Turque",
    "Européenne"
]
americaine = ["Grillade",
    "Mexicaine",
    "Americaine"
]
autres = ["Fruit de mer",
    "Boulangerie",
    "Coffee Shop"
]

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
boissons = ["Alcoolisés",
    "Non-Alcoolisés",
    "Autres"
]
dd = ["Glaces",
    "Gâteaux",
    "Pains et Viennoiseries",
    "Douceurs",
    "Autres"
]
ef =["Salade",
    "Burger",
    "Sandwich",
    "Kebab",
    "Poulet et nuggets",
    "Frites",
    "Pizza",
    "Snack",
    "Autres"
]
hot = ["Soupe",
    "Pâte",
    "Halal",
    "Seafood",
    "Viandes",
    "Végétariens",
    "Autres"
]


for index in 0..2 do
    CategoryDish.create(name: boissons[index], type_id: 1)
end

for index in 0..4 do
    CategoryDish.create(name: dd[index], type_id: 2)
end

for index in 0..8 do
    CategoryDish.create(name: ef[index], type_id: 3)
end

for index in 0..6 do
    CategoryDish.create(name: hot[index], type_id: 4)
end

#Generer Restaurant
name = ["Au coeur de JADE",
    "Tend'M",
    "La Dynastie",
    "La Marmite du Chef",
    "Le Carnivore BAR",
    "Koots Food",
    "GasyProGrill",
    "Banana Split"
]
location = ["Mahamasina",
    "Ampasinimalo",
    "Isotry",
    "Ambohinjatovo",
    "Ambatonakanga",
    "Mahamasina",
    "Mahamasina",
    "Andraharo"
]
description = ["Green for Hope",
    "Food is BAE, NoRegime",
    "it's time to EAT",
    "The Chief is on board",
    "Meal Meal Meal",
    "Authentic food quality",
    "President's favorite food",
    "Douceurs tous les jours"
]
logo = ["logoJADE.png",
    "logoTendM.jpg",
    "logoDynastie.png",
    "logoMarmite.jpg",
    "logoCarnivore.jpg",
    "logoKoots.png",
    "logoGpg.jpg",
    "logoBanana.png"
]
picture = ["aboutJade.jpg",
    "aboutTendM.jpg",
    "aboutDynastie.png",
    "aboutMarmite.jpg",
    "aboutCarnivore.jpg",
    "aboutKoots.png",
    "aboutGpg.jpg",
    "aboutBanana.jpg"
]
phone = ["033 42 027 48",
    "032 27 391 94",
    "+33 5 81 41 95 92",
    "034 42 729 44",
    "020 22 241 98",
    "033 17 716 71",
    "032 79 163 04",
    "020 23 368 93"
]
email = ["jadeleresto@gmail.com",
    "tendm@gmail.com",
    "dynastie@gmail.com",
    "lamarmiteduchef@gmail.com",
    "lecarnivoremada@gmail.com",
    "kootsfood@gmail.com",
    "gasyprogrill@gmail.com",
    "bananasplit@gmail.com"
]

for index in 0...name.length do
    Restaurant.create(name: name[index], location: location[index], description: description[index],
        logo: logo[index],picture: picture[index],phone_number: phone[index],email: email[index])
end

#Associer resto et Specialité
jade = [1, 2, 7, 15]
tendm = [2, 12, 15, 10]
dyna = [ 2 ]
marmite = [ 1 ]
carni = [12, 14]
koots = [1, 2, 19]
gpg = [12, 14, 16]
banana = [18, 19]

for index in 0...jade.length do
    RestoSpeciality.create(restaurant_id: 1 ,speciality_id: jade[index])
end
for index in 0...tendm.length do
    RestoSpeciality.create(restaurant_id: 2 ,speciality_id: tendm[index])
end
for index in 0...dyna.length do
    RestoSpeciality.create(restaurant_id: 3 ,speciality_id: dyna[index])
end
for index in 0...marmite.length do
    RestoSpeciality.create(restaurant_id: 4 ,speciality_id: marmite[index])
end
for index in 0...carni.length do
    RestoSpeciality.create(restaurant_id: 5 ,speciality_id: carni[index])
end
for index in 0...koots.length do
    RestoSpeciality.create(restaurant_id: 6 ,speciality_id: koots[index])
end
for index in 0...gpg.length do
    RestoSpeciality.create(restaurant_id: 7 ,speciality_id: gpg[index])
end
for index in 0...banana.length do
    RestoSpeciality.create(restaurant_id: 8 ,speciality_id: banana[index])
end

#Generer les plats


for index in 0..4 do
    Dish.create(name:Faker::Food.dish , description:Faker::Food.description ,price: rand(2..26)*1000,
        preparation_time: rand(20..59),picture: "#{rand(1..16)}" ,
        restaurant_id: 1 ,category_dish_id: rand(1..24))
end
for index in 5..9 do
    Dish.create(name:Faker::Food.dish , description:Faker::Food.description ,price: rand(2..26)*1000,
        preparation_time: rand(20..59),picture: "#{rand(1..16)}" ,
        restaurant_id: 2 ,category_dish_id: rand(1..24))
end
for index in 10..14 do
    Dish.create(name:Faker::Food.dish , description:Faker::Food.description ,price: rand(2..26)*1000,
        preparation_time: rand(20..59),picture: "#{rand(1..16)}" ,
        restaurant_id: 3 ,category_dish_id: rand(1..24))
end
for index in 15..19 do
    Dish.create(name:Faker::Food.dish , description:Faker::Food.description ,price: rand(2..26)*1000,
        preparation_time: rand(20..59),picture: "#{rand(1..16)}" ,
        restaurant_id: 4 ,category_dish_id: rand(1..24))
end
for index in 20..24 do
    Dish.create(name:Faker::Food.dish , description:Faker::Food.description ,price: rand(2..26)*1000,
        preparation_time: rand(20..59),picture: "#{rand(1..16)}" ,
        restaurant_id: 5 ,category_dish_id: rand(1..24))
end
for index in 25..29 do
    Dish.create(name:Faker::Food.dish , description:Faker::Food.description ,price: rand(2..26)*1000,
        preparation_time: rand(20..59),picture: "#{rand(1..16)}" ,
        restaurant_id: 6 ,category_dish_id: rand(1..24))
end
for index in 30..34 do
    Dish.create(name:Faker::Food.dish , description:Faker::Food.description ,price: rand(2..26)*1000,
        preparation_time: rand(20..59),picture: "#{rand(1..16)}" ,
        restaurant_id: 7 ,category_dish_id: rand(1..24))
end
for index in 35..39 do
    Dish.create(name:Faker::Food.dish , description:Faker::Food.description ,price: rand(2..26)*1000,
        preparation_time: rand(20..59),picture: "#{rand(1..16)}" ,
        restaurant_id: 8 ,category_dish_id: rand(1..24))
end
