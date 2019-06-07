require 'csv'
require 'date'
require 'json'

active_create_users = true
active_create_site = true
active_create_astro_events = true
active_create_events = true


def phone_random
  "#{%w[+33 (+33) 0].sample}#{rand(6..7)}#{rand.to_s[2..9]}"
end

def fake_meteo(level)

  case level
  when "extra-good"
    cloudiness = rand(5)
  when "good"
    cloudiness = rand(5) + 10
  when "bad"
    cloudiness = 90
  end
  humidity = rand(20) + 30


  [{"night"=>(Date.today + 0).strftime("%d-%m-%Y"),
    "weathers"=>
     [{"date"=>(Date.today + 0).strftime("%d-%m-%Y"), "time"=>"18h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>1.86},
      {"date"=>(Date.today + 0).strftime("%d-%m-%Y"), "time"=>"21h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>0.71},
      {"date"=>(Date.today + 1).strftime("%d-%m-%Y"), "time"=>"00h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.11},
      {"date"=>(Date.today + 1).strftime("%d-%m-%Y"), "time"=>"03h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.23}]},
   {"night"=>(Date.today + 1).strftime("%d-%m-%Y"),
    "weathers"=>
     [{"date"=>(Date.today + 1).strftime("%d-%m-%Y"), "time"=>"18h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.84},
      {"date"=>(Date.today + 1).strftime("%d-%m-%Y"), "time"=>"21h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>1.73},
      {"date"=>(Date.today + 2).strftime("%d-%m-%Y"), "time"=>"00h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.08},
      {"date"=>(Date.today + 2).strftime("%d-%m-%Y"), "time"=>"03h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>0.78}]},
   {"night"=>(Date.today + 2).strftime("%d-%m-%Y"),
    "weathers"=>
     [{"date"=>(Date.today + 2).strftime("%d-%m-%Y"), "time"=>"18h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.83},
      {"date"=>(Date.today + 2).strftime("%d-%m-%Y"), "time"=>"21h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.96},
      {"date"=>(Date.today + 3).strftime("%d-%m-%Y"), "time"=>"00h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.53},
      {"date"=>(Date.today + 3).strftime("%d-%m-%Y"), "time"=>"03h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.72}]},
   {"night"=>(Date.today + 3).strftime("%d-%m-%Y"),
    "weathers"=>
     [{"date"=>(Date.today + 3).strftime("%d-%m-%Y"), "time"=>"18h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.88},
      {"date"=>(Date.today + 3).strftime("%d-%m-%Y"), "time"=>"21h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.12},
      {"date"=>(Date.today + 4).strftime("%d-%m-%Y"), "time"=>"00h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>1.41},
      {"date"=>(Date.today + 4).strftime("%d-%m-%Y"), "time"=>"03h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>2.27}]},
   {"night"=>(Date.today + 4).strftime("%d-%m-%Y"),
    "weathers"=>
     [{"date"=>(Date.today + 4).strftime("%d-%m-%Y"), "time"=>"18h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>1.91},
      {"date"=>(Date.today + 4).strftime("%d-%m-%Y"), "time"=>"21h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>1.73},
      {"date"=>(Date.today + 5).strftime("%d-%m-%Y"), "time"=>"00h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>0.77},
      {"date"=>(Date.today + 5).strftime("%d-%m-%Y"), "time"=>"03h00", "humidity"=>humidity, "cloudiness"=>cloudiness, "wind_speed_ms"=>1.58}]}]
end

def create_users
  User.destroy_all
  ap "Creating users..."
  User.create!(avatar: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1559749796/yggm1un6ednflwzgssyp.jpg"), username: "Adele", password: "123456", email: "adele.soullier@gmail.com", mobile: phone_random, send_welcome: false )
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
  ap "#{User.count} users created !"
end

def create_site
  Site.destroy_all
  ap "Creating Sites..."
  filepath = 'db/gresac-astro-sites.csv'

  CSV.foreach(filepath, headers: :first_row, encoding: "utf-8") do |row|
    address = "#{row["Site"]}, #{row["Commune"]}, #{row["Région"]}"
    Site.create!(
      address: address,
      lat: row["Latitude"].to_f,
      lng: row["Longitude"].to_f,
      description: row["Description"],
      light_pol_index: row["Indice PL"].to_i,
      photo: row["Photo"],
      next_5_days_meteo: fake_meteo("bad")
      )
  end

  Site.find_by(address: "La Buissoniere, Saint Romain, Auvergne").update(next_5_days_meteo: fake_meteo("good"))
  Site.find_by(address: "Cret de l oeillon, Doizieu, Rhône-Alpes").update(next_5_days_meteo: fake_meteo("good"))
  Site.find_by(address: "Observatoire Pierre Joannard, Ramasse, Rhône-Alpes").update(next_5_days_meteo: fake_meteo("extra-good"))
  Site.find_by(address: "Observatoire de Lyon, St Genis-Laval, Rhône-Alpes").update(next_5_days_meteo: fake_meteo("extra-good"))
  Site.find_by(address: "Observatoire de Jolimont, Toulouse, Midi-Pyrénées").update(next_5_days_meteo: fake_meteo("extra-good"))

  ap "#{Site.count} sites created !"
end

def create_astro_events
  Event.destroy_all
  AstroEvent.destroy_all

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
end

def create_events
  Participation.destroy_all
  Event.destroy_all
  UpdateEvents.call(false)
  ap "#{Event.count} events created !"
end

def uniq?(array)
  array.length == array.uniq.length
end

def create_participations
  puts "Creating participations ...."
  Participation.destroy_all
  observatoir_lyon = Site.find_by(address: "Observatoire de Lyon, St Genis-Laval, Rhône-Alpes")
  event1 = Event.find_by(site: observatoir_lyon)
  event1.date = Date.tomorrow
  event1.score = { total_score: 9,
             light_pol_score: 7,
             cloudiness_score: 10,
             astro_event_score: 10,
             moon_score: 6 }
  event1.save!
  Participation.create!(user: User.find_by(username: 'ThomasP'), event: event1, material: {telescope: true} )
  Participation.create!(user: User.find_by(username: 'Vicouille'), event: event1, material: {vehicle: true})

  Message.create!(body:"Ca va être une superbe nuit !", user_id: User.find_by(username: 'ThomasP').id, event_id: event1.id)
  Message.create!(body:"Je partirai de Lyon en voiture. Qui veut une place ?", user_id: User.find_by(username: 'Vicouille').id, event_id: event1.id)

  array = []
  50.times do
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
  ap "#{Participation.count} participations created !"
end

create_users if active_create_users
create_site if active_create_site
create_astro_events if active_create_astro_events
create_events if active_create_events
create_participations
