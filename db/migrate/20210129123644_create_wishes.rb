class CreateWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :wishes do |t|
      t.string :title,      null: false
      t.date :deadline
      t.text :memo
      t.boolean :completed, null: false
      t.timestamps
    end
  end
end
