class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :status
      t.datetime :date
      t.integer :event_score
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
