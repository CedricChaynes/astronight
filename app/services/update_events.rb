# frozen_string_literal: true

class UpdateEvents < BaseService
  THRESHOLD = 6

  attr_reader :update_weather

  def initialize(update_weather = true)
    @update_weather = update_weather
  end

  def call
    destroy_old_events
    WeatherCrawler.call if update_weather
    create_and_update_events
  end

  private

  def destroy_old_events
    Event.where("date < ?", Time.zone.today).destroy_all
    Event.find_each do |event|
      event.destroy unless event.participations.any?
    end
  end

  def create_and_update_events
    Site.find_each do |site|
      date = Time.zone.today
      limit = Time.zone.today + 5

      while date < limit
        score = CalcScore.call(site, date)

        if score[:total_score] >= THRESHOLD
          event = Event.find_by(site: site, date: date)

          if event.nil?
            Event.create!(site: site, score: score, date: date)
          else
            event.update(score: score)
          end
        end

        date += 1
      end
    end
  end
end
