class UserMailer < ActionMailer::Base
  default from: "noreply@herokuapp.com"
  def notice(mark)
    @receiver1 = "toannm3110@gmail.com"
    # @receiver2 = "loandt1991@gmail.com"
    @mark = mark
    # mail(to: [@receiver1,@receiver2], subject: "News from UET")
    mail(to: @receiver1, subject: "News from UET")
  end
end
