class Appointment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doctor
  belongs_to :patient
end
