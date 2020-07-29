# frozen_string_literal: true

namespace :synchro do
  desc "Update weather data and create, update and destroy events according to their updated score"
  task events: :environment do
    UpdateEvents.call
  end
end
