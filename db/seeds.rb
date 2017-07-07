# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "admin", email: "admin@example.com", password_digest: "admin", user_level: 1)

Post.create!(title: "Sample Post", content: "Sample Content", categories: "category", price: "14", description: "This is a short description", image: "http://placehold.it/600x400")
Post.create!(title: "Another Post", content: "Post 2", categories: "category", price: "20", description: "This is a short description", image: "http://placehold.it/600x400")
