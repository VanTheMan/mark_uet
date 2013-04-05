class Subject < ActiveRecord::Base
  attr_accessible :name, :code
  has_and_belongs_to_many :users

  def self.find_or_create(attributes)
    Subject.where(attributes).first || Subject.create(attributes)
  end

  def self.search(q)
    Subject.where(name: q).first.nil? ? Subject.where(code: q).first : Subject.where(name: q).first
  end
end
