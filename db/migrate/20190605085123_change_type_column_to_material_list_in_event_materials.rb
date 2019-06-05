class ChangeTypeColumnToMaterialListInEventMaterials < ActiveRecord::Migration[5.2]
  def change
    rename_column :event_materials, :type, :material_list
    change_column :event_materials, :material_list, :jsonb, using: "material_list::jsonb", default: {}
  end
end
