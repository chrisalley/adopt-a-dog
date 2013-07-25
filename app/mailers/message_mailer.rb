class MessageMailer < ActionMailer::Base
  default :from => "Adopt a Dog Hastings <noreply@adoptadog.org.nz>"
  
  def send_message(message) 
    @message = message 
    mail(:to => "info@adoptadog.org.nz", :subject => "New contact form message")
  end
  
end