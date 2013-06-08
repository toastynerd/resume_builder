class Resume < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :presence => true
  validates :description, :presence => true
end
