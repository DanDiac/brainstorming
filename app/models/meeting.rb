class Meeting < ActiveRecord::Base

	belongs_to :owner, :class_name => "User"
	has_many :meeting_invites
	has_many :invitees, :through => "meeting_invites"
	has_many :notes

	validates_presence_of :name, :message => "You need to pick a name for the meeting."
	validates_presence_of :objective, :message => "You need to choose an objective for the meeting"
	validates_presence_of :start_time, :message => "You need to select a starting time."
	validates_presence_of :end_time, :message => "You need to select an ending time."
	validate :time_logics
	
	scope :past, -> { where(["end_time < ?", Time.now]) }
	scope :running, -> { where(["start_time < ? and end_time > ?", Time.now, Time.now])}
	scope :upcoming, -> { where(["start_time > ?", Time.now ]) }
	
	def time_logics
		if self.start_time < Time.now
			errors.add(:start_time, "Starting time can't be in the past.")
		end
		if !start_time.nil? && !end_time.nil? && start_time > end_time
			errors.add(:end_time, "Ending time has to be in the future of start time.")
		end
	end
	
	def members
		invitees.to_a.push(owner)
	end

end
