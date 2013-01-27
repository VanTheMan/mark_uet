class User < ActiveRecord::Base
  attr_accessible :email

  def self.find_or_create(attributes)
    User.where(attributes).first || User.create(attributes)
  end
end
