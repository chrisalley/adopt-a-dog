ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "noreply@adoptadog.org.nz",
  :password             => "DogAdopt#6",
  :authentication       => "plain",
  :enable_starttls_auto => true
}