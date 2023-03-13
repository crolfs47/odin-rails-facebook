# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

users = User.create([
  { email: 'crolfs47@gmail.com', password: 'password', first_name: 'Cathy', last_name: 'Rolfs', location: 'Chicago' },
  { email: 'test1@test.com', password: 'password', first_name: 'Alex', last_name: 'Thornburg', location: 'Chicago' },
  { email: 'test2@test.com', password: 'password', first_name: 'Guest', last_name: 'Guest', location: 'Chicago' },
  { email: 'test3@test.com', password: 'password', first_name: 'Pete', last_name: 'Davidson', location: 'Chicago' },
])