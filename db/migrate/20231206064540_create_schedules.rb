class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :title, null:false
      t.text :content
      t.datetime :start_time, null:false
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
