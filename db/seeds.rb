# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cuis = Cuisine.create({name: 'Japanese'})
city = City.create({name: 'Gastown'})


 User.create({first_name: 'Jennifer',
              last_name: 'Lawrence',
              email: 'Jenn@gmail.com',
              password: 'zain',
              city: city,
              cuisine: cuis })

 User.create({first_name: 'Emma',
              last_name: 'Watson',
              email: 'Emma@gmail.com',
              password: 'zain',
              city: city,
              cuisine: cuis })

 User.create({first_name: 'Danaerys',
              last_name: 'T',
              email: 'dany@gmail.com',
              password: 'zain',
              city: city,
              cuisine: cuis })

 User.create({first_name: 'Justin',
              last_name: 'Biebs',
              email: 'jbiebs@gmail.com',
              password: 'zain',
              city: city,
              cuisine: cuis })

 User.create({first_name: 'Blake',
              last_name: 'Lively',
              email: 'blake@gmail.com',
              password: 'zain',
              city: city,
              cuisine: cuis })



puts Cowsay.say('Generated 20 Users with cuisines and cities broo', 'random')
