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
    unknowns = ["INT 3011", "INT 3066", "INT 3093", "INT 3061"]
    unknowns.each do |u|
      if m = Mark.where(code: u).first
        if (Time.now.min - m.uploaded_at.min) < 10
          UserMailer.notice(m).deliver
        end
      end
    end
  end
end
