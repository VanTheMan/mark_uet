class UserMailer < ActionMailer::Base
  default from: "noreply@herokuapp.com"
  def notice(mark)
    @receiver1 = "toannm3110@gmail.com"
    @receiver2 = "loandt1991@gmail.com"
    # @receiver3 = "54ca@googlegroups.com"
    @mails = User.all.map{ |u| u.email }
    @mails += [@receiver1,@receiver2]

    @mark = mark
    mail(to: @mails, subject: "News from UET")
  end
end
