class RenameCardColumnsToLanes < ActiveRecord::Migration[7.1]
  def change
    rename_table :card_columns, :lanes
    rename_column :cards, :card_column_id, :lane_id
  end
end
