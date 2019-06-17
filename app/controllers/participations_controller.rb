class ParticipationsController < ApplicationController
  before_action :set_event, only: %i[create]
  before_action :set_participation, only: %i[destroy]

  def index
    @participations = current_user.participations
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    @participation.event = @event
    @participation.save!
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @participation.destroy!
    redirect_to participations_path
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_participation
    @participation = Participation.find(params[:id])
  end

  def participation_params
    if params[:participation_form].nil?
      telescope = vehicle = false
    else
      telescope = params[:participation_form][:telescope] == "on"
      vehicle = params[:participation_form][:vehicle] == "on"
    end
    { material: { telescope: telescope, vehicle: vehicle } }
  end
end
