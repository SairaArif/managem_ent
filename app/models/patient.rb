class Patient < ActiveRecord::Base
  attr_accessible :age, :disease, :gender, :name
 validates_uniqueness_of :name 
  belongs_to :doctor
end
