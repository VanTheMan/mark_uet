class Subject < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :users

  def self.find_or_create(attributes)
    Subject.where(attributes).first || Subject.create(attributes)
  end
end
