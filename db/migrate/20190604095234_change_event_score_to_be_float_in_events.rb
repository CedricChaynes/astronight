class ChangeEventScoreToBeFloatInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :event_score, :float
  end
end
