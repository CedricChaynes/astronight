class CalcScore
  require 'lunartic'
  def initialize(site, date)
    @site = site
    @date = date
  end

  def call
    # TO DO algorithmie de calcul du score
    light_pol_score = @site.light_pol_index

    json_from_file = File.read("#{Rails.root}/app/services/weather_by_site_by_night.json")
    sites = JSON.parse(json_from_file)
    site_data = sites.find { |site| @site.lat == site["Latitude"] && @site.lng == site["Longitude"] }
    weather_that_night = site_data["Weather_next_5_nights"]
                         .find { |weather| weather["night"] == @date.strftime('%d-%m-%Y') }
    avg_cloudness = weather_that_night["weathers"].sum { |h| h["cloudness"] } / weather_that_night["weathers"].size

    cloudness_score = case avg_cloudness
                      when 0...10 then 20
                      when 10...20 then 15
                      when 20...40 then 10
                      when 40...60 then 5
                      else -100
                      end

    astro_event_score = AstroEvent.where(date: @date).score

    moon_score = ((1 - Lunartic.on_date(@date).percent_full) * 20).round(0)

    score = (light_pol_score + cloudness_score + astro_event_score + moon_score) / 4

    return score.positive ? score : 0
  end

  def self.call(site, date)
    new(site, date).call
  end
end
