class Notification < ApplicationMailer

	default from: 'brainstorms@thinslices.com'
 
  def invitation_mail(user, meeting)
    @user = user
    @meeting = meeting
    mail(to: @user.email, subject: '#{@meeting.name} meeting invite: #{@meeting.start_time.strftime("%B %d, %Y %H:%M:%S")}')
  end

end
