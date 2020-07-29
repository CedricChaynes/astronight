# frozen_string_literal: true

BASE_URL = "https://api.openweathermap.org/data/2.5/forecast?"
API_END_POINT = "&appid=a446fe9e3cd285feac70ef567c436196"

class WeatherCrawler < BaseService
  require "open-uri"
  require "json"

  attr_reader :logger

  def initialize
    @logger = Logger.new(STDOUT)
  end

  def call
    count = 0
    Site.find_each do |site|
      next_5_days_meteo = next_5_days_meteo(site)

      # Add delay between each API request
      sleep(1)
      log_debug_data(count, site, next_5_days_meteo)

      # Update site
      site.update(next_5_days_meteo: next_5_days_meteo)
      # Add delay to avoid API ban
      count += 1
      sleep(30) if (count % 50).zero?
    end
  end

  private

  def next_5_days_meteo(site)
    night_data = []
    fetch_weather_data(site)["list"].each do |result|
      next unless %w[18 21 00 03].include?(parse_time(result)[0])

      night_data << create_hash(result)
    end
    filter_night_data_for_next_5_days(night_data)
  end

  def log_debug_data(count, site, next_5_days_meteo)
    logger.debug { count }
    logger.debug { "Fetching weather for #{site.address}..." }
    logger.debug { next_5_days_meteo }
    logger.debug { "-" * 100 }
  end

  def fetch_weather_data(site)
    query = "lat=#{site.lat}&lon=#{site.lng}&units=metric"
    JSON.parse(URI.parse("#{BASE_URL}#{query}#{API_END_POINT}").open.read)
  end

  def filter_night_data_for_next_5_days(night_data)
    filtered_night_data = next_five_nights.map do |night|
      {
        night: night,
        weathers: night_data.select do |weather|
          night_of_current_day?(night, weather) || twilight_of_next_day?(night, weather)
        end
      }
    end
    filtered_night_data.reject! { |weather| weather[:weathers].empty? }
  end

  def create_hash(result)
    {
      "date" => parse_date(result),
      "time" => parse_time(result)[0..-2].join("h"),
      "cloudiness" => result["clouds"]["all"],
      "humidity" => result["main"]["humidity"],
      "widn_speed_ms" => result["wind"]["speed"]
    }
  end

  def parse_date(result)
    result["dt_txt"].split[0].split("-").reverse.join("-")
  end

  def parse_time(result)
    result["dt_txt"].split[1].split(":")
  end

  def parse_hour(time)
    time.split("h")[0]
  end

  def night_of_current_day?(date_string, weather)
    weather["date"] == date_string &&
      %w[18 21].include?(parse_hour(weather["time"]))
  end

  def twilight_of_next_day?(date_string, weather)
    weather["date"] == next_date(date_string) &&
      %w[00 03].include?(parse_hour(weather["time"]))
  end

  def next_five_nights
    nights = []
    temp = 0
    while temp < 6
      nights << (Time.zone.today + temp).strftime("%d-%m-%Y")
      temp += 1
    end
    @next_five_nights ||= nights
  end

  def next_date(date_string)
    dates = date_string.split("-").reverse.map(&:to_i)
    (Date.new(dates[0], dates[1], dates[2]) + 1).strftime("%d-%m-%Y")
  end
end
