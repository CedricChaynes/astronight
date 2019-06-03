require 'csv'
require 'date'
require 'faker'
require 'json'

puts "Destroying previous seeds..."
AstroEvent.destroy_all
Participation.destroy_all
Event.destroy_all
User.destroy_all
Site.destroy_all
puts "Previous seeds destroyed !"

unless Site.any?
  filepath = 'db/astronomical_sites_gresac.csv'

  CSV.foreach(filepath, headers: :first_row) do |row|
    address = "#{row["Site"]}, #{row["Commune"]}, #{row["Région"]}"
    Site.create!(
      address: address,
      lat: row["Latitude"].to_f,
      lng: row["Longitude"].to_f,
      description: row["Description"],
      light_pol_index: row["Indice PL"].to_i
      )
  end
end

puts "Creating users..."

User.create(username: "user1", password: "123456", email: "user1@gmail.com", mobile: "0142054472")

10.times do
  User.create!(
    username: Faker::Name.first_name,
    password: "123456",
    email: Faker::Internet.email,
    mobile: "#{%w[+33 (+33) 0].sample}#{rand(6..7)}#{rand.to_s[2..9]}",
    avatar: "https://res.cloudinary.com/dzphrxzjj/image/upload/v1558087038/sample.jpg"
    )
end

puts "Users created !"

puts "Creating Events...."
sites = Site.all
10.times do
  Event.create!(
    site_id: sites.sample.id,
    status: ["pending", "created"].sample,
    event_score: rand(5..10),
    date: rand(Date.today..Date.civil(2019, 06, 10))
    )
end
puts "Events created !"

puts "Creating participations ...."

users = User.all
events = Event.all

100.times do
  Participation.create!(
      event_id: events.sample.id,
      user_id: users.sample.id
    )
end

puts "Participations created"

puts "Creating Astro Events. . . ."
data = open('db/astronomical_events.json').read
astroevents = JSON.parse(data)
astroevents.each do |ev|
  date = start_date = Date.strptime(ev["J-Avant"], '%d/%m/%Y')
  end_date = Date.strptime(ev["J-Apres"], '%d/%m/%Y')
  while date <= end_date
    AstroEvent.create!(date: date,
                       title: ev["Titre"],
                       description: ev["Description"],
                       score: ev["Note"].to_i,
                       duration: (end_date - start_date).to_i + 1)
    date += 1
  end
end

puts "#{AstroEvent.count} Astro Events created"
puts "yeah !"


