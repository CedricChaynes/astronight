class ChangeEventMaterialsToMaterials < ActiveRecord::Migration[5.2]
  def change
    rename_table :event_materials, :materials
  end
end
