class AddUserIdToWishes < ActiveRecord::Migration[6.0]
  def change
    add_column :wishes, :user_id, :integer
  end
end
