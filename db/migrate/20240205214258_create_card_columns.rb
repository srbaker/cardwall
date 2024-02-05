class CreateCardColumns < ActiveRecord::Migration[7.1]
  def change
    create_table :card_columns do |t|
      t.string :title

      t.timestamps
    end
  end
end
