class CalcScore
  require 'lunartic'
  def initialize(site, date)
    @site = site
    @date = date
  end

  def call
    p @site
    # calculate score based on light pollution
    light_pol_score = @site.light_pol_index
    p "Light polution score: #{light_pol_score}"
    # calculate score based on cloudness
    if @site.next_5_days_meteo.nil?
      cloudiness_score = -100
    else
      weather_that_night = @site.next_5_days_meteo
                                .find { |hash| hash["night"] == @date.strftime('%d-%m-%Y') }
      if weather_that_night["weathers"].empty?
        cloudiness_score = -100
      else
        avg_cloudiness = weather_that_night["weathers"].sum { |h| h["cloudiness"] } / weather_that_night["weathers"].size
        cloudiness_score = case avg_cloudiness
                           when 0...10 then 20
                           when 10...20 then 15
                           when 20...40 then 10
                           when 40...60 then 5
                           else -100
                           end
      end
    end
    p "Cloudiness score: #{cloudiness_score}"
    # calculate score based on astro event significance
    astro_event_score = AstroEvent.find_by(date: @date) ? 0 : AstroEvent.find(date: @date).score
    p "Astronomical event score #{astro_event_score}"
    # calculate score based on moon status
    moon_score = ((1 - Lunartic.on_date(@date).percent_full) * 20).floor

    # calculate total score from 4 criteria
    total_score = ((light_pol_score + cloudiness_score + astro_event_score + moon_score) / 4).floor
    total_score = total_score.positive? ? total_score : 0
    p "Total score #{total_score}/20"
    p "-" * 100
    return { total_score: total_score,
             light_pol_score: light_pol_score,
             cloudiness_score: cloudiness_score,
             astro_event_score: astro_event_score,
             moon_score: moon_score }
  end

  def self.call(site, date)
    new(site, date).call
  end
end
