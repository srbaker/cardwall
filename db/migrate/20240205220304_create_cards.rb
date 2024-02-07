class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :lane, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
