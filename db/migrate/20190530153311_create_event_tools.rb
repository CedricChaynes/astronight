class CreateEventTools < ActiveRecord::Migration[5.2]
  def change
    create_table :event_tools do |t|
      t.string :type
      t.references :participation, foreign_key: true

      t.timestamps
    end
  end
end
