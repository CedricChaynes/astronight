class EventMaterial < ApplicationRecord
  belongs_to :participation
  has_one :owner, through: :participation, class_name: 'User', foreign_key: 'user_id'
  has_one :event, through: :participation
end
