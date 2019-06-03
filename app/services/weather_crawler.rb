class WeatherCrawler
  require 'open-uri'
  require 'json'

  def self.call
    unwanted_list = %w[LatD LatM LatS LatDir LngD LngM LngS LngDir]

    baseurl = "https://api.openweathermap.org/data/2.5/forecast?"
    api = "&appid=a446fe9e3cd285feac70ef567c436196"

    json_from_file = File.read("#{Rails.root}/app/services/gresac-astro-sites.json")
    data = JSON.parse(json_from_file)

    count = 0
    treated_data = []
    data.each do |elem|
      element = {}
      query = "lat=#{elem['Latitude']}&lon=#{elem['Longitude']}&units=metric"
      url = "#{baseurl}#{query}#{api}"
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
      elem.entries.each do |entry|
        element[entry[0]] = entry[1] unless unwanted_list.include?(entry[0])
      end

      element["Weather_next_5_days"] = array

      site = Site.find_by(address: "#{element['Site']}, #{element['Commune']}, #{element['Région']}")
      site.update(next_5_days_meteo: element['Weather_next_5_days'])

      sleep(1)
      p count
      p "Fetching weather for site #{elem['N°']}..."
      p "-" * 100
      count += 1
      sleep(60) if (count % 50).zero?
    end
  end
end
