class Event < ApplicationRecord
  belongs_to :site
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :messages, dependent: :destroy

  def score_pollution
    rand(100)
  end

  def score_cloud
    rand(100)
  end

  def score_events
    rand(80..100)
  end

  def score_lune
    rand(70..100)
  end
end
