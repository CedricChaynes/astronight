require 'json'
require 'date'

@date = Date.today
@site = { lat: 44.0822222222222, lng: 4.3925 }

json_from_file = File.read("weather_by_site_by_night.json")
sites = JSON.parse(json_from_file)
site_data = sites.find { |site| [@site[:lat], @site[:lng]] == [site["Latitude"], site["Longitude"]] }
puts JSON.pretty_generate(site_data)

weather_that_night = site_data["Weather_next_5_nights"]
                     .find { |weather| weather["night"] == @date.strftime('%d-%m-%Y') }
p weather_that_night
