class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: :create

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.event = @event
    if @message.save
      respond_to do |format|
        format.html { redirect_to event_path(@event) }
        format.js
      end
    else
      redirect_to event_path(@event)
      @message.errors.full_messages
    end
  end

  private

  def message_params
    params.permit(:body)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
