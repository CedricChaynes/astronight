class ParticipationsController < ApplicationController
  before_action :set_event, only: %i[create]
  before_action :set_participation, only: %i[destroy]

  def create
    @participation = Participation.new
    @participation.user = current_user
    @participation.event = @event
    @participation.save
    redirect_to event_path(@event)
  end

  def destroy
    @participation.destroy!
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_participation
    @participation = Participation.find(params[:id])
  end
end
