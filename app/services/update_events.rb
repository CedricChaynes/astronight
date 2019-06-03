class UpdateEvents
  def initialize
    @threshold = 5
  end

  def call
    # begin
      destroy_old_events
      WeatherCrawler.call
      WeatherByNightConverter.call
      create_new_events
      update_score_events
    # rescue e
    #   puts e.message
    #   puts e.backtrace.inspect
    # end
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
        event.event_score = skcore
        event.save
      end
    end
  end
end
