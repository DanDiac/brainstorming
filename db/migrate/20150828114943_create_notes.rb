class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
			t.integer :user_id
			t.integer :meeting_id
			t.text :text
      t.timestamps null: false
    end
  end
end
