class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def search
    @search = params[:searchform]
    @address = @search[:address]
    @start_date = @search[:start_date]
    @end_date = @search[:end_date]
    search_params = { address: @address, start_date: @start_date, end_date: @end_date }

    if @address == ""
      @events = Event.where(["date >= ? and date <= ?", @start_date, @end_date])
    else
      @near = Site.near(@address, 50).map { |site| site.id }
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
