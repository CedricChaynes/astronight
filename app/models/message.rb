# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
