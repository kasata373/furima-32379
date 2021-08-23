class RenamePrectureIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :precture_id, :prefecture_id
  end
end
