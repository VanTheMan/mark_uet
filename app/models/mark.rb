class Mark < ActiveRecord::Base
  attr_accessible :link, :title, :uploaded_at, :code, :category
  default_scope order('uploaded_at desc')

  scope :filter_int, where("category like ?", "INT")
  scope :filter_mat, where("category like ?", "MAT")
  scope :filter_phy, where("category like ?", "PHY")

  def self.find_or_create(attributes)
    Mark.where(attributes).first || Mark.create(attributes)
  end

  def self.find_unknowns
    # unknowns = ["INT 3066", "INT 3093", "INT 3061"]
    User.all.each do |u|
      u.subjects.each do |subject|
        if m = Mark.where(code: subject.code).first
          if (Time.now + 7.hours - m.uploaded_at) > 0 && (Time.now + 7.hours - m.uploaded_at) < 10.minutes
            UserMailer.notice(m,u.email).deliver
          end
        end
      end
    end
    # unknowns.each do |u|
    #   if m = Mark.where(code: u).first
    #     # if Mark.check_time(Time.now, m.uploaded_at)
    #     #   UserMailer.notice(m).deliver
    #     # end
    #     if (Time.now + 7.hours - m.uploaded_at) > 0 && (Time.now + 7.hours - m.uploaded_at) < 10.minutes
    #       UserMailer.notice(m).deliver
    #     end
    #   end
    # end
  end

  def self.check_time(now, upload)
    if (now.day == upload.day) && (now.hour + 7 == upload.hour) && (now.min - upload.min < 10)
      return true
    end
  end
end
