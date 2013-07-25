class UserMailer < ActionMailer::Base
  default :from => "Adopt a Dog Hastings <noreply@adoptadog.org.nz>"
  
  def registration_confirmation(user)  
    @user = user
    mail(:to => user.email_address, :subject => "Registered")  
  end  

end
