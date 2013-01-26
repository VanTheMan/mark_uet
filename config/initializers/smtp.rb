ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 25,
  :domain               => 'asiaexpat.com.sg',
  :user_name            => 'team@vinova.sg',
  :password             => 'vinova01',
  :authentication       => 'plain'
}