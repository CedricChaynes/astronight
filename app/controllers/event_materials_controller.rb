class EventMaterialsController < ApplicationController
  def create
    EventMaterial.new(event_material_params)
    EventMaterial.participation = @participation
    EventMaterial.save
    redirect_to event_path(@event)
  end

  private
end
