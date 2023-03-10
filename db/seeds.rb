# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([
  { username: 'crolfs', email: 'test@test.com', first_name: 'Cathy', last_name: 'Rolfs', location: 'Chicago' },
  { username: 'alex', email: 'test1@test.com', first_name: 'Alex', last_name: 'Thornburg', location: 'Chicago' },
  { username: 'guest', email: 'test2@test.com', first_name: 'Guest', last_name: 'Guest', location: 'Chicago' },
  { username: 'crolfs', email: 'test@test.com', first_name: 'Cathy', last_name: 'Rolfs', location: 'Chicago' },
])