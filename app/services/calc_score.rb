class CalcScore
  require 'lunartic'
  def initialize(site, date)
    @site = site
    @date = date
  end

  def call
    # calculate score based on light pollution
    light_pol_score = @site.light_pol_index

    # calculate score based on cloudness
    weather_that_night = @site.next_5_days_meteo
                              .find { |hash| hash["night"] == @date.strftime('%d-%m-%Y') }
    if weather_that_night["weathers"].empty?
      cloudness_score = -100
    else
      avg_cloudness = weather_that_night["weathers"].sum { |h| h["cloudness"] } / weather_that_night["weathers"].size
      cloudness_score = case avg_cloudness
                        when 0...10 then 20
                        when 10...20 then 15
                        when 20...40 then 10
                        when 40...60 then 5
                        else -100
                        end
    end

    # calculate score based on astro event significance
    astro_event_score = AstroEvent.where(date: @date).score

    # calculate score based on moon status
    moon_score = ((1 - Lunartic.on_date(@date).percent_full) * 20).round(0)

    # calculate total score from 4 criteria
    total_score = (light_pol_score + cloudness_score + astro_event_score + moon_score) / 4
    total.score
    return total_score.positive ? total_score : 0
  end

  def self.call(site, date)
    new(site, date).call
  end
end
