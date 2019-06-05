class AddMaterialColumnToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :material, :jsonb, default: {}
  end
end
