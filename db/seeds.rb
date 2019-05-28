require 'faker'
require 'csv'

puts "Destroying previous seeds..."
Participation.destroy_all
Event.destroy_all
User.destroy_all
Site.destroy_all
puts "Previous seeds destroyed !"


puts "Creating users..."

User.create(username: "user1", password: "123456", email: "user1@gmail.com", mobile: "0142054472")

15.times do
  User.create!(
    username: Faker::Name.first_name,
    password: "123456",
    email: Faker::Internet.email,
    mobile: "#{%w[+33 (+33) 0].sample}#{rand(6..7)}#{rand.to_s[2..9]}",
    )
end

puts "Users created !"

puts "Creating Sites and Events...."
filepath = 'db/astronomical_sites_gresac.csv'

CSV.foreach(filepath, headers: :first_row) do |row|
  address = "#{row["Site"]}, #{row["Commune"]}, #{row["Région"]}"
  site = Site.create!(
    address: address,
    lat: row["Latitude"].to_f,
    lng: row["Longitude"].to_f,
    description: row["Description"],
    photo: row["Photo"],
    light_pol_index: row["Indice PL"].to_i
    )
    rand(0..3).times do
      Event.create!(
        site_id: site.id,
        status: ["pending", "created"].sample,
        event_score: rand(5..10),
        date: rand(Date.today..Date.civil(2019, 06, 10))
        )
    end
end

puts "Sites and Events created"

puts "Creating participations ...."

users = User.all
events = Event.all

500.times do
  Participation.create!(
      event_id: events.sample.id,
      user_id: users.sample.id
    )
end

puts "Participations created"






