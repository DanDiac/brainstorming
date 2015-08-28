class MeetingsController < ApplicationController
	
	layout false, :only => [:add_new_invitation, :add_note, :refresh_notes]
	
	def index
		
	end
	
	def new
		@meeting = Meeting.new
	end
	
	def show
		@meeting = Meeting.find params[:id]
		
		#can't show up uninvited
		unless @meeting.owner == current_user || @meeting.invitees.index(current_user)
			return redirect_to :controller => :meetings, :action => :index
		end
	end
	
	def create
		@meeting = current_user.meetings.build(meeting_params)
		@meeting.save
		if @meeting.errors.empty?
			redirect_to meeting_path(@meeting)
		else
			render "new"
		end
	end
	
	def add_new_invitation
	
		user = User.find params[:invite][:user]
		@meeting = Meeting.find params[:invite][:meeting]
		
		#can't have someone else creating meetings for me
		return unless @meeting.owner == current_user
		
		meeting_invite = @meeting.meeting_invites.build()
		meeting_invite.invitee = user
		meeting_invite.save
		
		#this shouldn't happen, but if it does, we should tell them
		#trying to invite an already invited user, that is
		if meeting_invite.errors.empty?
			flash[:errors] = nil
		else
			flash[:errors] = meeting_invite.errors.full_messages.join(';')
		end
		
		#only works with AJAX
		respond_to do |format|
			format.js
		end
		
	end
	
	def add_note
		note = current_user.notes.build(note_params)
		note.save
		
		#only works with AJAX
		@meeting = Meeting.find params[:note][:meeting_id]
		respond_to do |format|
			format.js
		end
	end
	
	def refresh_notes
		#just dummy function, to refresh notes
		
		@meeting = Meeting.find params[:id]
		respond_to do |format|
			format.js
		end
	end
	
private
  def meeting_params    
    params.require(:meeting).permit(:name, :objective, :start_time, :end_time)
  end
	
	def note_params
		params.require(:note).permit(:meeting_id, :text)
	end

end
