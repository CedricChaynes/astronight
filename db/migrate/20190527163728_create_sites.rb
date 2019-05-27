class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :address
      t.float :lat
      t.float :lng
      t.text :description
      t.string :photo
      t.integer :light_pol_index

      t.timestamps
    end
  end
end
