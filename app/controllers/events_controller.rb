class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def search
    @search = params[:searchform]
    search_params = { address: @address, date_range: @date_range, radius: @radius }
    @address = @search[:address]
    @date_range = @search[:date_range]
    @radius = @search[:radius].tr("km", "").to_i
    @start_date = Date.today
    case @date_range
    when "Aujourd'hui"
      @end_date = Date.today
    when "Les 7 prochains jours"
      @end_date = @start_date + 7
    when "Les 14 prochains jours"
      @end_date = @start_date + 14
    end

    if @address == ""
      @events = Event.where(["date >= ? and date <= ?", @start_date, @end_date])
    else
      @near = Site.near(@address, @radius).map { |site| site.id }
      @events = Event.where(["date >= ? and date <= ?", @start_date, @end_date]).where(site_id: @near)
    end
  end

  def show
    @event = Event(params[:id])
  end

  def new
  end

  def create
    @event = event.new
    @event.save
  end

  def update
  end

  def delete
  end

  def validated
  end

end
