class WeatherCrawler
  require 'open-uri'
  require 'json'

  def self.call
    unwanted_list = %w[LatD LatM LatS LatDir LngD LngM LngS LngDir]

    baseUrl = "https://api.openweathermap.org/data/2.5/forecast?";
    api = "&appid=a446fe9e3cd285feac70ef567c436196";

    json_from_file = File.read("gresac-astro-sites.json")
    data = JSON.parse(json_from_file)

    count = 0
    treated_data = []
    data.each do |elem|
      element = {}
      query = "lat=#{elem["Latitude"]}&lon=#{elem["Longitude"]}&units=metric"
      url = "#{baseUrl}#{query}#{api}"
      response = open(url).read
      results = JSON.parse(response)
      array = []
      results["list"].each do |result|
        if %w[18 21 00 03].include?(result["dt_txt"].split[1].split(':')[0])
          h = {}
          h["date"] = result["dt_txt"].split[0].split('-').reverse.join('-')
          h["time"] = result["dt_txt"].split[1].split(':')[0..-2].join('h')
          h["cloudiness"] = result["clouds"]["all"]
          h["humidity"] = result["main"]["humidity"]
          h["wind_speed_ms"] = result["wind"]["speed"]
          array << h
        end
      end
      elem.entries.each { |entry|
        element[entry[0]] = entry[1] unless unwanted_list.include?(entry[0])
      }
      element["Weather_next_5_days"] = array
      treated_data << element
      sleep(1)
      p count
      p "Fetching weather for site #{elem["N°"]}..."
      p "-"*100
      count += 1
      sleep(1.minutes) if count % 50 == 0
    end

    if File.zero?('weather_by_sites.json') || !File.exist?('weather_by_sites.json')
      File.open('weather_by_sites.json', "w") do |f|
        f.write(JSON.pretty_generate(treated_data))
      end
    else
      data_hash = JSON.parse(File.read("weather_by_sites.json"))
      data_hash.uniq!
      treated_data.each { |elem| data_hash << elem }
      File.open('weather_by_sites.json', "w") do |f|
        f.write(JSON.pretty_generate(data_hash))
      end
    end
  end
end





