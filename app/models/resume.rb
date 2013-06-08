class Resume < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :educations

  validates :name, :presence => true
  validates :description, :presence => true
end
