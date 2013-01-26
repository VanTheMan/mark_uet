class NoticeMailer < ActionMailer::Base
  default from: "Martin Nguyen"
  def notification
    @receiver = "toannm3110@gmail.com"
    mail(to: @receiver, subject: "New mark on UET")
  end
end
