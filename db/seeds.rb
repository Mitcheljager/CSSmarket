# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "admin", email: "admin@example.com", password: "admin", password_confirmation: "admin", user_level: 1)
User.create!(name: "user", email: "user@example.com", password: "user", password_confirmation: "user", user_level: 0)

Post.create!(title: "Sample Post", content: "Sample Content", categories: "menus", user_id: 2, price: "14", description: "This is a short description", image: "http://placehold.it/600x400", license: "Standard license")
Post.create!(title: "Another Post", content: "Post 2", categories: "buttons", user_id: 1, price: "20", description: "This is a short description", image: "http://placehold.it/600x400", license: "Standard license")
