class Event < ApplicationRecord
  belongs_to :site
  has_many :users, through: :participations
  has_many :participations, dependent: :destroy
  validates :site, presence: true
  validates :date, presence: true
end
