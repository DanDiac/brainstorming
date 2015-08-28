class MeetingInvite < ActiveRecord::Base

	belongs_to :invitation, :foreign_key => "meeting_id", :class_name => "Meeting"
	belongs_to :invitee, :foreign_key => "user_id", :class_name => "User"
	
	validates_uniqueness_of :user_id, scope: :meeting_id, message: "was already invited" 
	
end
