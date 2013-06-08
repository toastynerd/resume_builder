class Education < ActiveRecord::Base
  attr_accessible :description, :end_at, :name, :references, :start_at
  belongs_to :resume

  validates :name, :presence => true
  validates :description, :presence => true
end

