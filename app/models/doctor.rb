class Doctor < ActiveRecord::Base
  attr_accessible :name, :qualification, :specialist, :patients

  has_many :patients 
end
