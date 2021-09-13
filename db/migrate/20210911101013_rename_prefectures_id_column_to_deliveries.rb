class RenamePrefecturesIdColumnToDeliveries < ActiveRecord::Migration[6.0]
  def change
    rename_column :deliveries, :prefectures_id, :prefecture_id
  end
end
