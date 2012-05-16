class NotificationsMailer < ActionMailer::Base
  default :from => "admin@goingclubing.com"
  default :to => "admin@goingclubing.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Goingclubing.tld] #{message.subject}")
  end
end
