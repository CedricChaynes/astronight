class ChangeEventScoreToScoreInEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_score
    add_column :events, :score, :jsonb, default: {}
  end
end
