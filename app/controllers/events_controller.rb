# frozen_string_literal: true

class EventsController < ApplicationController
  require "uri"
  skip_before_action :authenticate_user!
  before_action :set_event, only: :show
  before_action :set_icons, only: %i[show search]

  def index
    @my_events = current_user.events
  end

  def search
    search_params = search_form_params.merge(
      end_date: end_date(params[:searchform][:date_range])
    )
    @events = filter_events(search_params).order_by_total_score
    set_markers_for_search
  end

  def show
    @message = Message.new
    @messages = @event.messages
    @participation = Participation.new
    @small_map = true
    set_markers_for_show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def start_date
    @start_date ||= Time.zone.today
  end

  def filter_events(search_params)
    if search_params[:address].blank?
      Event.where(
        date: start_date..search_params[:end_date]
      )
    else
      Event.where(
        date: start_date..search_params[:end_date],
        site_id: Site.near(*search_params.slice(:address, :radius).values)
                     .map(&:id)
      )
    end
  end

  def end_date(date_range)
    case date_range
    when "Aujourd'hui" then Time.zone.today
    when "7 prochains jours" then start_date + 7
    when "14 prochains jours" then start_date + 14
    end
  end

  def set_icons
    @icons = {
      base: helpers.asset_url("pin_base.png"),
      selected: helpers.asset_url("pin_selected.png")
    }
  end

  def set_markers_for_search
    @markers = @events.map do |event|
      {
        lat: event.site.lat,
        lng: event.site.lng,
        infoWindow: render_to_string(partial: "infowindow",
                                     locals: { event: event }),
        unique_id: event.id
      }
    end
  end

  def set_markers_for_show
    @markers = [
      {
        lat: @event.site.lat,
        lng: @event.site.lng,
        image_url: helpers.asset_url("map-marker.png")
      }
    ]
  end

  def search_form_params
    params[:searchform][:radius] = params[:searchform][:radius].tr("km", "").to_i
    params.require(:searchform).permit(:address, :date_range, :radius)
  end
end
