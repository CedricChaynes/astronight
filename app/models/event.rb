class Event < ApplicationRecord
  belongs_to :site
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :participations
end
