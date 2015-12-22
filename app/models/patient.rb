class Patient < ActiveRecord::Base
  attr_accessible :age, :disease, :gender, :name

  belongs_to :doctor
end
