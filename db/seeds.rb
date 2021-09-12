# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@rails.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now
            )   


(1..10).each do |n|
    name = "name#{n}"
    email = "test-#{n}@gmail.com"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password,
                 activated: true,
                 activated_at: Time.zone.now
                )
end

users = User.order(:created_at).take(6)
50.times do
  content =  "Test content !!"
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }