# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all if Rails.env.development?

p "nuking database"
Tab.destroy_all
Folder.destroy_all
User.destroy_all

p "planting seeds"
marshall = User.create!(name: 'Marshall', email: 'marshall@gmail.com', password: '123456')

kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123456')

nico = User.create!(name: 'Nico', email: 'nico@gmail.com', password: '123456')

desmond = User.create!(name: 'Desmond', email: 'desmond@gmail.com', password: '123456')

xiway = User.create!(name: 'Xiway', email: 'xiway@gmail.com', password: '123456')

Folder.destroy_all if Rails.env.development?

default = Folder.create!(name: 'Default', importance: true, user: marshall, coverimg: "https://images.unsplash.com/photo-1492269682833-cd80f8a20b08?ixid=MnwxMjA3fDB8MHxwaG90[…]GVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80")

food = Folder.create!(name: 'Food', importance: true, user: kevin, coverimg: "https://www.helpguide.org/wp-content/uploads/table-with-grains-vegetables-fruit-768.jpg")

tvshows = Folder.create!(name: 'TV Shows', user: nico, coverimg: "https://static1.colliderimages.com/wordpress/wp-content/uploads/2020/11/Best-tv-shows-Netflix-V3.png")

pets = Folder.create!(name: 'Pets', user: desmond, coverimg: "https://res.cloudinary.com/xiway/image/upload/v1618560558/Heizi_kftmot.jpg")

songs = Folder.create!(name: 'Songs', user: xiway,coverimg: "https://api.time.com/wp-content/uploads/2018/05/best-albums-so-far-2018.jpg")

Tab.create!(title: 'Rose', url: 'rose.com', folder: default)

Tab.create!(title: 'Hamburger', url: 'hamburger.com', folder: food)

Tab.create!(title: 'Seinfeld', url: 'seinfeld.com', folder: tvshows)

Tab.create!(title: 'Heizi', url: 'heizi-lifestyle.com', folder: pets)

Tab.create!(title: 'Shallow', url: 'a-star-is-born.com', folder: songs)

