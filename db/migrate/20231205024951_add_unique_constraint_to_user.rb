class AddUniqueConstraintToUser < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :unique_user_id, unique: true
  end
end
