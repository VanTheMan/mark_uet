class User < ActiveRecord::Base
  attr_accessible :email, :subjects_subcribe
  has_and_belongs_to_many :subjects

  def self.find_or_create(attributes)
    User.where(attributes).first || User.create(attributes)
  end
end
