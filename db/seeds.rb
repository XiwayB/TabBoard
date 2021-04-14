# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all if Rails.env.development?

marshall = User.create!(name: 'Marshall', email: 'marshall@gmail.com', password: '123456')

kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123456')

nico = User.create!(name: 'Nico', email: 'nico@gmail.com', password: '123456')

desmond = User.create!(name: 'Desmond', email: 'desmond@gmail.com', password: '123456')

xiway = User.create!(name: 'Xiway', email: 'xiway@gmail.com', password: '123456')

Folder.destroy_all if Rails.env.development?

default = Folder.create!(name: 'Default', importance: true, user: marshall)

food = Folder.create!(name: 'Food', importance: true, user: kevin)

tvshows = Folder.create!(name: 'TV Shows', user: nico)

pets = Folder.create!(name: 'Pets', user: desmond)

songs = Folder.create!(name: 'Songs', user: xiway)

Tab.create!(title: 'Rose', url: 'rose.com', folder: default)

Tab.create!(title: 'Hamburger', url: 'hamburger.com', folder: food)

Tab.create!(title: 'Seinfeld', url: 'seinfeld.com', folder: tvshows)

Tab.create!(title: 'Heizi', url: 'heizi-lifestyle.com', folder: pets)

Tab.create!(title: 'Shallow', url: 'a-star-is-born.com', folder: songs)
