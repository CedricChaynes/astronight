class UpdateEvents
  def initialize
    @threshold = 14
  end

  def call
    destroy_old_events
    WeatherCrawler.call
    create_new_events
    update_score_events
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
      score = CalcScore.call(site, Date.today)
      Event.create!(site: site, event_score: score, date: Date.today) if score >= @threshold
    end
  end

  def update_score_events
    Event.all.each do |event|
      score = CalcScore.call(event.site, Date.today)
      if score < @threshold || event.participations.empty?
        event.destroy
      else
        event.event_score = score
        event.save
      end
    end
  end
end
