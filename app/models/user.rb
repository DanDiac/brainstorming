class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	validates_presence_of :name, :message => "can't be blank."
	
	has_many :meetings, :foreign_key => "owner_id"
	has_many :meeting_invites
	has_many :invitations, :through => "meeting_invites"
	has_many :notes
	
end
