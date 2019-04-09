# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.delete_all

Author.create(first_name: 'Admin', last_name: 'User', email: 'admin@example.com', password: 'test', role: 2)
Author.create(first_name: 'Creator', last_name: 'User', email: 'creator@example.com', password: 'test', role: 0)
Author.create(first_name: 'Reviewer', last_name: 'User', email: 'review@example.com', password: 'test', role: 1)
