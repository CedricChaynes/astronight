require 'open-uri'
require 'json'

def next_five_nights
  nights = []
  temp = 0
  while temp < 6
    nights << (Date.today + temp).strftime('%d-%m-%Y')
    temp += 1
  end
  return nights
end

def next_date(date_string)
  dates = date_string.split('-').reverse.map(&:to_i)
  (Date.new(dates[0], dates[1], dates[2]) + 1).strftime('%d-%m-%Y')
end

data = File.read('weather_by_sites.json')
sites = JSON.parse(data)
array = []
sites.each do |site|
  element = {}
  site.entries.each do |entry|
    element[entry[0]] = entry[1] unless entry[0] == "Weather_next_5_days"
  end
  nights = next_five_nights()
  element["Weather_next_5_nights"] = nights.map do |night|
    { night: night,
      weathers: site["Weather_next_5_days"].select do |elem|
      (elem["date"] == night && %w[18 21].include?(elem["time"].split('h')[0])) ||
      (elem["date"] == next_date(night) && %w[00 03].include?(elem["time"].split('h')[0]))
      end
    }
  end
  array << element
end

File.open('weather_by_night.json', "w") do |f|
  f.write(JSON.pretty_generate(array))
end

