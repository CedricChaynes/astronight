class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :event_materials, dependent: :destroy
end
