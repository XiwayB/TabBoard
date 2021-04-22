# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all if Rails.env.development?

p "Nuking database.........."
Share.destroy_all
Tab.destroy_all
Folder.destroy_all
User.destroy_all
p "Confirmed: database is in ruins"

p "Planting seeds ............"
p "Seeds will take root in database"
p "     Moulding Users from dirt"
marshall = User.create!(name: 'Marshall', email: 'marshall@gmail.com', password: '123456')

kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123456')

nico = User.create!(name: 'Nico', email: 'nico@gmail.com', password: '123456')

desmond = User.create!(name: 'Desmond', email: 'desmond@gmail.com', password: '123456')

xiway = User.create!(name: 'Xiway', email: 'xiway@gmail.com', password: '123456')

Folder.destroy_all if Rails.env.development?
p "     Users are working ............"
p "          Users are creating folders"
default = Folder.create!(name: 'Default', importance: true, user: marshall, coverimg: "https://images.unsplash.com/photo-1492269682833-cd80f8a20b08?ixid=MnwxMjA3fDB8MHxwaG90[…]GVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80")

food = Folder.create!(name: 'Food', importance: true, user: kevin, coverimg: "https://www.helpguide.org/wp-content/uploads/table-with-grains-vegetables-fruit-768.jpg")

work = Folder.create!(name: 'Work', user: nico, coverimg: "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80")

pets = Folder.create!(name: 'Pets', user: desmond, coverimg: "https://res.cloudinary.com/xiway/image/upload/v1618560558/Heizi_kftmot.jpg")

nsfw = Folder.create!(name: 'NSFW', user: xiway,coverimg: "https://images.unsplash.com/photo-1447501614729-24781f73c2f1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1649&q=80")

p "          Users are creating Tabs"
Tab.create!(title: 'Rose', url: 'rose.com', folder: default)

Tab.create!(title: 'Hamburger', url: 'hamburger.com', folder: food)

Tab.create!(title: 'Javascript', url: 'Javascript.com', folder: work)

Tab.create!(title: 'Ruby', url: 'ruby.com', folder: work)

Tab.create!(title: 'SQL', url: 'sql.com', folder: work)

Tab.create!(title: 'C-for-dummies', url: 'dummy.com', folder: work)

Tab.create!(title: 'How-to-use-self', url: 'real-dummy.com', folder: work)

Tab.create!(title: 'Step sister stuck in the washing machine', url: 'beeeeep.com', folder: work)

Tab.create!(title: 'Thank god she is alive', url: 'beeeeep.com', folder: work)

Tab.create!(title: 'How to remove plunger from b**t', url: 'how-to.com', folder: work)

Tab.create!(title: 'Hospital Direction', url: 'maps.google.com', folder: work)

Tab.create!(title: 'Insurance', url: 'manulife.com', folder: work)


Tab.create!(title: 'Heizi', url: 'heizi-lifestyle.com', folder: pets)

Tab.create!(title: 'Where-to-eat', url: 'eat-there.com', folder: nsfw)

Tab.create!(title: 'Video-games', url: 'games.com', folder: nsfw)
p "Confirmed: seeds of humanity are planted"
p "Database civilization entering: Stage 2"
