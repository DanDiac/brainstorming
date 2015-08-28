class CreateMeetingInvites < ActiveRecord::Migration
  def change
    create_table :meeting_invites do |t|
			t.integer :meeting_id
			t.integer :user_id
      t.timestamps null: false
    end
  end
end
