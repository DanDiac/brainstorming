class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
			t.integer :owner_id
			t.string :name
			t.text :objective
			t.datetime :start_time
			t.datetime :end_time
      t.timestamps null: false
    end
  end
end
