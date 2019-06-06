class UpdateEvents
  def initialize
    @threshold = 0.7
  end

  def call
    destroy_old_events
    WeatherCrawler.call
    create_new_events
    # update_score_events
  end

  def self.call
    new.call
  end

  private

  def destroy_old_events
    Event.where("date < ?", Date.today).destroy_all
  end

  def create_new_events
    Site.all.each do |site|
      date = Date.today
      limit = Date.today + 5

      while date < limit
        score = CalcScore.call(site, date)
        Event.create!(site: site, score: score, date: date) if score[:total_score] >= @threshold
        date += 1
      end
    end
  end

  # def update_score_events
  #   Event.all.each do |event|
  #     score = CalcScore.call(event.site, event.date)
  #     if score < @threshold || event.participations.empty?
  #       event.destroy
  #     else
  #       event.score = score
  #       event.save
  #     end
  #   end
  # end
end
