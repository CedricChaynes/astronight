class DeleteMaterialsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :materials
  end
end
