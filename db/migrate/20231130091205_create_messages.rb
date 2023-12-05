class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.bigint :user_id, null:false
      t.references :room, null:false, foreign_key:true
      t.timestamps
    end

    add_foreign_key :messages, :users, column: :user_id

  end
end
