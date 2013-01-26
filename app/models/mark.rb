class Mark < ActiveRecord::Base
  attr_accessible :link, :title, :uploaded_at, :code, :category
  default_scope order('uploaded_at desc')

  scope :filter_int, where("category like ?", "INT")
  scope :filter_mat, where("category like ?", "MAT")
  scope :filter_phy, where("category like ?", "PHY")

  def self.find_or_create(attributes)
    Mark.where(attributes).first || Mark.create(attributes)
  end
end
