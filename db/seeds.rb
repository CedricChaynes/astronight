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


puts "Creating Sites..."

filepath = 'db/gresac-astro-sites.csv'

unless Site.any?
  CSV.foreach(filepath, headers: :first_row, encoding: "ISO-8859-1") do |row|
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

puts "Sites created !"

def phone_random
  "#{%w[+33 (+33) 0].sample}#{rand(6..7)}#{rand.to_s[2..9]}"
end

puts "Creating users..."

User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583834/hdnzsqq8nbzykjmke2pl.jpg"), username: "JeanGui", password: "123456", email: "user1@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583835/ubhhxuc1mzvjoxzobfpy.png"), username: "Clotilde", password: "123456", email: "user2@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583837/bl1qneguma0r5edculig.jpg"), username: "Maximus", password: "123456", email: "user3@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583818/g4w3pu9m0vxd6juymnvd.png"), username: "Alex", password: "123456", email: "user4@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583820/whjz6z0k4id33s6uf0nm.jpg"), username: "Franti", password: "123456", email: "user5@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583821/hctffbe0ujbfsvnjil7u.jpg"), username: "Yaya", password: "123456", email: "user6@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583823/y4rgehd1jxepc717kjky.jpg"), username: "AlinaFace", password: "123456", email: "user7@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583825/qecd5o1kah7gwvif7hg6.jpg"), username: "RaphMass", password: "123456", email: "user8@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583826/qggdqfsj6l9nhy1vwigd.jpg"), username: "Armen", password: "123456", email: "user9@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583828/eb9djdmijcarivvq2j9t.jpg"), username: "Vicouille", password: "123456", email: "user10@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583830/ah4ltm1fpeq7auc8hhqm.jpg"), username: "CChaynes", password: "123456", email: "user11@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583831/ol7syy8uqc8nuwppfeji.png"), username: "Manu", password: "123456", email: "user12@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583833/wknell31vkx1ocwyxhed.jpg"), username: "JonasChan", password: "123456", email: "user13@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583838/uzvlbksgnv0agmkwyjrv.jpg"), username: "NicoGuth", password: "123456", email: "user14@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583840/gpwnlkbftvckhp9cqjra.jpg"), username: "Toto", password: "123456", email: "user15@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583841/pedyx50cupy8zpkgobsf.png"), username: "RaphMan", password: "123456", email: "user16@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583842/d2znp32oxorgmgx3asjn.jpg"), username: "ThomasP", password: "123456", email: "user17@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583844/u3fjal9egwo3zf7hysxf.jpg"), username: "PokéCharline", password: "123456", email: "user18@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583846/enzwjmnyteqzjvpfmqdf.jpg"), username: "Dareth", password: "123456", email: "user19@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559583847/vscplyewl5mzp3cphpfw.jpg"), username: "LoloNaitz", password: "123456", email: "user20@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559584053/qqylrv3jgd4knufo5zsy.jpg"), username: "NathTai", password: "123456", email: "user22@gmail.com", mobile: phone_random, send_welcome: false )
User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559584094/seqxa48ckqdng5ibla7w.jpg"), username: "Pierre", password: "123456", email: "user23@gmail.com", mobile: phone_random, send_welcome: false )

puts "Users created !"

puts "Creating Events...."
sites = Site.all
50.times do
  light_pol_score = rand(0..20)
  cloudiness_score = [-100, 5, 10, 15, 20].sample
  astro_event_score = rand(0..20)
  moon_score = rand(0..20)
  total_score = ((light_pol_score + cloudiness_score + astro_event_score + moon_score) / 4).floor

  Event.create!(
    site_id: sites.sample.id,
    status: ["pending", "created"].sample,
    score: { total_score: total_score,
             light_pol_score: light_pol_score,
             cloudiness_score: cloudiness_score,
             astro_event_score: astro_event_score,
             moon_score: moon_score },
    date: rand(Date.today..Date.civil(2019, 06, 21))
    )
end
puts "Events created !"

puts "Creating participations ...."

def uniq?(array)
  array.length == array.uniq.length
end

array = []
100.times do
  event_id = Event.all.sample.id
  user_id = User.all.sample.id
  array << [event_id, user_id]
  if uniq?(array)
    Participation.create!(
        event_id: event_id,
        user_id: user_id
      )
  end
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
