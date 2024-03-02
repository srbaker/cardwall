class AddPositionToCardAndLane < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :position, :integer
    add_column :lanes, :position, :integer

    Card.order(:updated_at).each.with_index(1) do |card, index|
      card.update_column :position, index
    end

    Lane.order(:updated_at).each.with_index(1) do |lane, index|
      lane.update_column :position, index
    end
  end
end
