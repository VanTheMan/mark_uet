class UserMailer < ActionMailer::Base
  default from: "noreply@herokuapp.com"
  def notice(mark,email)
    @mark = mark
    @receiver = email
    mail(to: email, subject: "News from UET")
  end
end
