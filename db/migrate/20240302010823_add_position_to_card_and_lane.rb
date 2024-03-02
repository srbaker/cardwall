class AddPositionToCardAndLane < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :position, :integer
    add_column :lanes, :position, :integer
  end
end
