class EventsController < ApplicationController
  require 'uri'
  skip_before_action :authenticate_user!
  before_action :set_event, only: %i[show update delete]

  def index
    @my_events = current_user.events
  end

  def search
    @search = params[:searchform]
    @address = @search[:address]
    @date_range = @search[:date_range]
    @radius = @search[:radius].tr("km", "").to_i
    @start_date = Date.today
    @end_date = case @date_range
                when "Aujourd'hui" then Date.today
                when "7 prochains jours" then @start_date + 7
                when "14 prochains jours" then @start_date + 14
                end

    if @address == ""
      @events = Event.where(date: @start_date..@end_date).order("score --> 'total_score' DESC")
    else
      @near = Site.near(@address, @radius).map(&:id)
      @events = Event.where(date: @start_date..@end_date)
                     .where(site_id: @near).order("score --> 'total_score' DESC")
    end

    @markers = @events.map do |event|
      {
        lat: event.site.lat,
        lng: event.site.lng,
        infoWindow: render_to_string(partial: "infowindow", locals: { event: event }),
        image_url: helpers.asset_url('map-marker.png')
      }
    end
  end

  def show
    @message = Message.new
    @messages = @event.messages
    @participation = Participation.new
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
