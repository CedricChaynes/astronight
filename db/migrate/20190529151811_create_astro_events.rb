class CreateAstroEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :astro_events do |t|
      t.datetime :date
      t.string :title
      t.text :description
      t.integer :score
      t.integer :duration

      t.timestamps
    end
  end
end
