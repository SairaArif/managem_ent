class Doctor < ActiveRecord::Base
  attr_accessible :name, :qualification, :specialist, :patients
   validates_uniqueness_of :name 
  has_many :patients 
end
