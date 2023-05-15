# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Friendship.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('friendships')
Notification.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('notifications')
Event.destroy_all 
ActiveRecord::Base.connection.reset_pk_sequence!('events')
Rsvp.destroy_all 
ActiveRecord::Base.connection.reset_pk_sequence!('rsvps')

users = User.create([
  { email: 'crolfs47@gmail.com', password: 'password', full_name: 'Cathy Rolfs', location: 'Chicago, IL', birthday: "1989-06-01", college: "Notre Dame", high_school: "Chicago High School", occupation: "Student" },
  { email: 'monstera@test.com', password: 'password', full_name: 'Monstera Deliciosa', location: 'Chicago, IL', birthday: "2000-01-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'pothos@test.com', password: 'password', full_name: 'Golden Pothos', location: 'Chicago, IL', birthday: "2000-02-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'snakeplant@test.com', password: 'password', full_name: 'Snake Plant', location: 'Chicago, IL', birthday: "2000-03-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'birdofparadise@test.com', password: 'password', full_name: 'Bird Of Paradise', location: 'Chicago, IL', birthday: "2000-04-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'jadeplant@test.com', password: 'password', full_name: 'Jade Plant', location: 'Chicago, IL', birthday: "2000-05-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'fiddleleaffig@test.com', password: 'password', full_name: 'Fiddle Leaf Fig', location: 'Chicago, IL', birthday: "2000-06-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'dracaena@test.com', password: 'password', full_name: 'Dracaena Marginata', location: 'Chicago, IL', birthday: "2000-07-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'pricklypear@test.com', password: 'password', full_name: 'Prickly Pear', location: 'Chicago, IL', birthday: "2012-08-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'rubberplant@test.com', password: 'password', full_name: 'Rubber Plant', location: 'Chicago, IL', birthday: "2012-08-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'burrostail@test.com', password: 'password', full_name: 'Burros Tail', location: 'Chicago, IL', birthday: "2012-10-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'topsyturvy@test.com', password: 'password', full_name: 'Topsy Turvy', location: 'Chicago, IL', birthday: "2012-11-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'echeveria@test.com', password: 'password', full_name: 'Echeveria Elegans', location: 'Chicago, IL', birthday: "2012-12-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'parlorpalm@test.com', password: 'password', full_name: 'Parlor Palm', location: 'Chicago, IL', birthday: "2015-02-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'ponytailpalm@test.com', password: 'password', full_name: 'Ponytail Palm', location: 'Chicago, IL', birthday: "2015-03-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'aloevera@test.com', password: 'password', full_name: 'Aloe Vera', location: 'Chicago, IL', birthday: "2015-04-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'pilea@test.com', password: 'password', full_name: 'Pilea Peperomioides', location: 'Chicago, IL', birthday: "2015-05-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'prayerplant@test.com', password: 'password', full_name: 'Prayer Plant', location: 'Chicago, IL', birthday: "2015-06-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'pincushioncactus@test.com', password: 'password', full_name: 'Pincushion Cactus', location: 'Chicago, IL', birthday: "2015-07-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'alocasiaodora@test.com', password: 'password', full_name: 'Alocasia Odora', location: 'Chicago, IL', birthday: "2015-08-01", college: "Plant University", high_school: "Plant High School", occupation: "Plant" },
  { email: 'guest@test.com', password: 'password', full_name: 'Guest User', location: 'Unknown', birthday: "2023-01-01", college: "Unknown", high_school: "Unknown", occupation: "Unknown" },
])


users.each do |user|
  user.avatar.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/avatars/#{user.id}.png")),
    filename: "#{user.id}.png"
  )
end
