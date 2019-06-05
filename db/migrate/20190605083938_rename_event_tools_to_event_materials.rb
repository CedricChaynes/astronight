class RenameEventToolsToEventMaterials < ActiveRecord::Migration[5.2]
  def change
    rename_table :event_tools, :event_materials
  end
end
