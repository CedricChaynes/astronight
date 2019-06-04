class WeatherCrawler
  require 'open-uri'
  require 'json'

  def self.call
    baseurl = "https://api.openweathermap.org/data/2.5/forecast?"
    api = "&appid=a446fe9e3cd285feac70ef567c436196"

    count = 0
    Site.all.each do |elem|
      element = {}
      query = "lat=#{elem.lat}&lon=#{elem.lng}&units=metric"
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

        nights = self.next_five_nights
        element["Weather_next_5_nights"] = nights.map do |night|
          { night: night,
            weathers: array.select do |elem|
              (elem["date"] == night && %w[18 21].include?(elem["time"].split('h')[0])) ||
                (elem["date"] == next_date(night) && %w[00 03].include?(elem["time"].split('h')[0]))
            end }
        end
      end

      sleep(1)
      p count
      p "Fetching weather for #{elem.address}..."
      element["Weather_next_5_nights"].reject! { |elem| elem[:weathers].empty? }
      p element["Weather_next_5_nights"]
      p "-" * 100
      site = Site.find_by(lat: elem.lat, lng: elem.lng)
      site.update(next_5_days_meteo: element["Weather_next_5_nights"])
      count += 1
      sleep(30) if (count % 50).zero?
    end
  end

  def self.next_five_nights
    nights = []
    temp = 0
    while temp < 6
      nights << (Date.today + temp).strftime('%d-%m-%Y')
      temp += 1
    end
    return nights
  end

  def self.next_date(date_string)
    dates = date_string.split('-').reverse.map(&:to_i)
    (Date.new(dates[0], dates[1], dates[2]) + 1).strftime('%d-%m-%Y')
  end
end
