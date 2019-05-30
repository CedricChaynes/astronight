class EventTool < ApplicationRecord
  CATEGORIES = ["Moyen de Transport", "Matériel d'Observations"]
  belongs_to :participation

  validates :category, presence: true, inclusion: { in: CATEGORIES.map(&:downcase) }
end
