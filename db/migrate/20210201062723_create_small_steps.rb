class CreateSmallSteps < ActiveRecord::Migration[6.0]
  def change
    create_table   :small_steps do |t|
      t.string     :text,    null: false
      t.boolean    :done,    default: false
      t.belongs_to :wish
      t.timestamps
    end
  end
end
