# frozen_string_literal: true

class UpdateEvents
  THRESHOLD = 6

  def call(update_weather)
    destroy_old_events
    WeatherCrawler.call if update_weather
    create_and_update_events
  end

  def self.call(update_weather = true)
    new.call(update_weather)
  end

  private

  def destroy_old_events
    Event.where("date < ?", Time.zone.today).destroy_all
    Event.all.each do |event|
      event.destroy unless event.participations.any?
    end
  end

  def create_and_update_events
    total = Site.count
    Site.all.each_with_index do |site, i|
      ap "#{i} / #{total}"
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
