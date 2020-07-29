# frozen_string_literal: true

class CalcScore < BaseService
  require "lunartic"

  attr_reader :site, :date

  def initialize(site, date)
    @site = site
    @date = date
  end

  def call
    { total_score: total_score,
      light_pol_score: light_pol_score,
      cloudiness_score: cloudiness_score,
      astro_event_score: astro_event_score,
      moon_score: moon_score }
  end

  private

  def light_pol_score
    @light_pol_score ||= site.light_pol_index
  end

  def cloudiness_score
    score = -100
    if site.next_5_days_meteo
      weather_that_night = site.next_5_days_meteo
                               .find { |h| h["night"] == date.strftime("%d-%m-%Y") }
      score = cal_cloudiness_score(weather_that_night) unless weather_that_night["weathers"].empty?
    end
    @cloudiness_score ||= score
  end

  def cal_cloudiness_score(weather)
    avg_cloudiness =
      weather["weathers"].sum { |h| h["cloudiness"] } / weather["weathers"].size

    case avg_cloudiness
    when 0...10 then 20
    when 10...20 then 15
    when 20...40 then 10
    when 40...60 then 5
    else -100
    end
  end

  def astro_event_score
    @astro_event_score ||= AstroEvent.find_by(date: date)&.score || 0
  end

  def moon_score
    @moon_score ||= ((1 - Lunartic.on_date(date).percent_full) * 20).floor
  end

  def total_score
    sum = light_pol_score + cloudiness_score + astro_event_score + moon_score
    avg = (sum / 8).floor
    @total_score ||= avg.positive? ? avg : 0
  end
end
