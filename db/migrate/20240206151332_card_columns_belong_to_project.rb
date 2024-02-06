class CardColumnsBelongToProject < ActiveRecord::Migration[7.1]
  def change
    add_reference :card_columns, :project, foreign_key: true
  end
end
