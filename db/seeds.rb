# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin type
TypeAdmin.create(name:"super admin")
TypeAdmin.create(name:"admin restaurant")
# Admin
Admin.create(email:"tsiory@gmail.com",password:"azerty",type_admin_id:1)
puts "Admin created"
# Abonnement et type d'abonnement
#type
type = ["User",
    "Restaurant"
    ]
type.each do |types|
    SubscriptionType.create(name: types)
    print "."
end

puts "subscriptionType created"
#abonnement
nameA = ["Cristal",
    "Gold",
    "Silver",
    "Cristal",
    "Gold",
    "Silver"
]
priceA = ["40000",
    "21000",
    "12000",
    "150000",
    "90000",
    "50000"
]
picA = ["cristal2.jpg",
    "gold2.jpg",
    "silver2.jpg",
    "cristal2.jpg",
    "gold2.jpg",
    "silver2.jpg"
]
colorA = ["#f20dd5",
    "#feff00",
    "#c0c0c0",
    "#f20dd5",
    "#feff00",
    "#c0c0c0"
]
referenceA = ["1",
    "1",
    "1",
    "2",
    "2",
    "2"
]

for index in 0...nameA.length do
    subs = Subscription.create(name: nameA[index],
        price: priceA[index],
        color: colorA[index],
        picture: picA[index],
        subscription_type_id: referenceA[index])
    print "."
end

    puts "subscription created"
# user
emails =  ["danielrazafindrakoto@gmail.com",
            "joellerakoto@gmail.com",
            "razafi@gmail.com",
            "rabe@gmail.com",
            "randria@gmail.com",
            "tefisoa@gmail.com",
            "njakaarijao@gmail.com",
            "livajaona@yahoo.com",
            "ndrianakely@hotmail.com",
            "landryrajao@livemail.fr"]

first_names = ["Daniel",
               "Joelle",
               "Ra",
               "Ra",
                "Ran",
                "Tefy",
                "Njaka",
                "Liva",
                "Ndriana",
                "Landry"]
last_names = ["Razafindrakoto",
              "Rakoto",
              "Rabe",
              "Randria",
              "Soa",
              "Ary",
              "Jaona",
              "Kely",
              "Rajao"]
# usernames
usernames = ["Daniel",
    "Joelle",
    "Ra",
    "Ra",
     "Ran",
     "Tefy",
     "Njaka",
     "Liva",
     "Ndriana",
     "Landry"]

for index_user in 0 ... last_names.size do
    User.create(email:emails[index_user],first_name:first_names[index_user],last_name:last_names[index_user],
        username:usernames[index_user],password:"sayna2019")
        print "."
end

puts "User created"

# cart_id
 for index_cart in 0 ... 10 do
    Cart.create(user:User.find_by(id: index_cart))
    print "."
 end

 puts "cart created"

# Categories des Specialités de restaurant
categories = ["Malagasy",
    "Asiatique",
    "Indienne",
    "Européenne",
    "Américaine",
    "Fast-food",
    "Autres"
]
logoC = ["Madagascar.jpg",
"asiatique.jpg", "indou.jpg","europe.jpg","usa.jpg","logofast.jpg",
"other.jpg"
]
for index in 0..6 do
Category.create(name: categories[index], logo:logoC[index])
print "."
end

puts "CategorieResto created"

#Specialités des restaurants
asiatique = ["Chinoise",
    "Japonaise",
    "Coréenne",
    "Thaïlandaise",
    "Vietnamienne",
    "Asiatique"
]
logoA = ["chinoise.jpg","japanese.jpg",
"coree.jpg","thai.jpg","viet.jpg","asia.jpg"
]
europeen = ["Française",
    "Italienne",
    "Turque",
    "Européenne"
]
logoE = ["french.jpeg","italia.jpeg",
"turc.png","euro.jpeg"
]
americaine = ["Grillade",
    "Mexicaine",
    "Americaine"
]
logoAM = ["grill.jpg","mexique.jpg",
"americ.jpg"
]
autres = ["Fruit de mer",
    "Boulangerie",
    "Coffee Shop"
]
logoAU = ["fdemer.jpeg","boul.jpeg",
"cof.jpeg"
]
Speciality.create(name: "Malagasy",logo: "malagasy.jpg", category_id: 1)
print "."

for index in 0..5 do
    Speciality.create(name: asiatique[index],logo: logoA[index],  category_id: 2)
    print "."
end

Speciality.create(name: "Indienne",logo: "inde.jpg" ,category_id: 3)
print "."

for index in 0..3 do
    Speciality.create(name: europeen[index],logo: logoE[index], category_id: 4)
    print "."
end

for index in 0..2 do
    Speciality.create(name: americaine[index],logo: logoAM[index], category_id: 5)
    print "."
end

Speciality.create(name: "Fast-food",logo: "ffood.jpeg", category_id: 6)
print "."

for index in 0..2 do
    Speciality.create(name: autres[index],logo: logoAU[index], category_id: 7)
    print "."
end

puts "specialities created"

#Types des plats
type = ["Boissons","Desserts et douceurs","Entrée et Fast-food", "Plats chauds"]
icon = ["db-icon.png","ds-icon.png","ff-icon.png","sc-icon.png"]
logoT = ["drinks.jpg","Dessert.jpeg","fastfoods.jpg","hotplat.jpeg"]
for index in 0..3 do
    Type.create(name: type[index], icon: icon[index],logo: logoT[index])
    print "."
end
puts "Dish type created"

#Categories des plats
boissons = ["Alcoolisés",
    "Non-Alcoolisés",
    "Thé et Autres"
]
picB = ["alcohol.jpg",
"nonalcool.jpg",
"tea.jpg"
]
dd = ["Glaces",
    "Gâteaux",
    "Pains et Viennoiseries",
    "Douceurs",
    "Autres"
]
picDD = ["glace.jpg",
"gateau.jpg",
"pain.jpg",
"douceur.jpg",
"crepe.jpg"
]
ef =["Salade",
    "Burger",
    "Sandwich",
    "Kebab",
    "Poulet et nuggets",
    "Pizza",
    "Autres"
]
picEF = ["salad.jpg",
"burger.jpg",
"sandwich.jpg",
"kebab.jpg",
"poulet.jpg",
"pizza.jpg",
"sushi.jpg"
]
hot = ["Pasta",
    "Halal",
    "Seafood",
    "Grillades",
    "Végétariens",
    "Autres"
]
picHot = ["pasta.jpg",
"Halal.jpg",
"seafood.jpg",
"grillade.jpg",
"vegan.jpg",
"food.jpg"
]

for index in 0..2 do
    CategoryDish.create(name: boissons[index], picture: picB[index], type_id: 1)
    print "."
end

for index in 0..4 do
    CategoryDish.create(name: dd[index], picture: picDD[index], type_id: 2)
    print "."
end

for index in 0..6 do
    CategoryDish.create(name: ef[index], picture: picEF[index], type_id: 3)
    print "."
end

for index in 0..5 do
    CategoryDish.create(name: hot[index], picture: picHot[index], type_id: 4)
    print "."
end

puts "CategoriesDish created"

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
description = ["Green for Hope",
    "Food is BAE, NoRegime",
    "it's time to EAT",
    "The Chief is on board",
    "Meal Meal Meal",
    "Authentic food quality",
    "President's favorite food",
    "Douceurs tous les jours"
]

phone = ["334202748",
    "322739194",
    "335814195",
    "344272944",
    "202224198",
    "331771671",
    "327916304",
    "202336893"
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
    a = Admin.create(email:email[index],password:"azerty",type_admin_id:2)
    resto = Restaurant.create(name: name[index], location: location[index], description: description[index],phone_number: phone[index],email: email[index],
        subscription_id: rand(5..8),admin:a)
        resto.logo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', logo[index])),filename:logo[index])
        resto.picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', picture[index])),filename:picture[index])

        print "."
end

puts "Restaurant created"

#Associer resto et Specialité
jade = [1, 2, 7, 15,8,11]
tendm = [2, 12, 15, 10, 4,9]
dyna = [ 2, 5,6,7, ]
marmite = [ 1,10,13,17, ]
carni = [12, 14,13,15,16]
koots = [1, 2, 19,14]
gpg = [12, 14, 16, 3]
banana = [18, 19]

for index in 0...jade.length do
    RestoSpeciality.create(restaurant_id: 1 ,speciality_id: jade[index])
    print "."
end
for index in 0...tendm.length do
    RestoSpeciality.create(restaurant_id: 2 ,speciality_id: tendm[index])
    print "."
end
for index in 0...dyna.length do
    RestoSpeciality.create(restaurant_id: 3 ,speciality_id: dyna[index])
    print "."
end
for index in 0...marmite.length do
    RestoSpeciality.create(restaurant_id: 4 ,speciality_id: marmite[index])
    print "."
end
for index in 0...carni.length do
    RestoSpeciality.create(restaurant_id: 5 ,speciality_id: carni[index])
    print "."
end
for index in 0...koots.length do
    RestoSpeciality.create(restaurant_id: 6 ,speciality_id: koots[index])
    print "."
end
for index in 0...gpg.length do
    RestoSpeciality.create(restaurant_id: 7 ,speciality_id: gpg[index])
    print "."
end
for index in 0...banana.length do
    RestoSpeciality.create(restaurant_id: 8 ,speciality_id: banana[index])
    print "."
end

puts "Restospeciality created"

#Generer les plats

plat = [
"Biryani","Café",
"Gâteau au chocolat","Coca-cola",
"Crepe Tend'M","Burger Valentin's Day",
"Emincé de Dinde", "Falafel Vegan", "Plateau délice des mers",
"Glace en pots","Kinder Bueno", "Buffet Carnivore", "Obama's nuggets",
"Pizza du Roi","Pain au raisin","Salade mixte","Kebab Cordon Bleu",
"Fidel Castro's Sandwich","Soupe chinoise","Tacos del diablo","Three Horse Beer"
]
photoplat = [
"birhyani.jpg","cafe.jpg","choco.jpg","coca.jpg",
"crepeT.jpg","crepehh.jpeg","dinde.jpg", "falafel.jpeg", "fruitdemer.jpg",
"glaceP.jpg","kinder.jpg","Buffet.jpg","nuggets.jpeg","pizzaFr.jpeg",
"raisin.jpg","saladeV.jpeg","sandKebab.jpg","sandwichW.jpeg","soupeT.jpg",
"Tacos.jpeg","thb.jpg"
]
dishdescrip = [
"Plat typique indien,riz,poulet ou chèvre","Noir 100% Arabica",
"Chocolat de Madagascar 72%","Brrrrrrr, savourez le moment",
"Douceur supreme","Un délice pour sceller l'amour","délice 100% Halal",
"Magique et délicieux sans avoir à tuer", "saveur des mers malagasy",
"Parfum au choix","Muy bueno","Manger comme un lion","les nuggets de poulet du Président",
"Pizza royale ingrédients au choix", "pain au raisin à la french",
"la nature dans votre assiette","Spécialité Turc avec touche française",
"Sandwich au porc de Castro de 1kg","Soupe chinoise de la région SAVA",
"Muy Caliente, Muy Picante","Soa ny fiarahantsika"
]
priceD = [
16000,3000,5000,3400,8000,20000,18000,23000,30000,4000,8000,50000,15000,
14000,2000,6000,11000,28000,10500,12000,2800
]
categD = [
21,3,5,2,8,10,17,20,18,4,7,19,13,14,6,9,12,11,16,15,1
]
restoD = [
1,8,8,2,2,6,3,6,4,8,8,5,7,4,8,3,1,7,3,6,5
]
for index in 0...plat.length do
   d =  Dish.create(name:plat[index] , description:dishdescrip[index] ,price: priceD[index],
        preparation_time: rand(20..59),
        restaurant_id: restoD[index] ,category_dish_id: categD[index])
        d.picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', photoplat[index])),filename: photoplat[index])
        print "."
end

puts "Dish created"
subscr = [
1,2,3,4,5,6
]
priv = [
    "Livraison avec priorisation: Ultime",
    "Livraison avec priorisation: Avant Silver",
    "Livraison SANS priorisation",
    "Le restaurant est toujours affiché en premier plan",
    "Le restaurant est affiché aprés celui des Cristals",
    "Le restaurant est affiché en dernier plan"
]
#Todo
for index in 0..subscr.length do
    SubscriptionPrivilege.create(subscription_id: subscr[index],privilege: priv[index])
    print "."
end
puts "SubscriptionPrivilege created"