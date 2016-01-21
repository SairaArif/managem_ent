class Patient < ActiveRecord::Base
  attr_accessible :age, :disease, :gender, :name, :attachments_attributes
  validates_uniqueness_of :name 
  belongs_to :doctor
  has_many :appointments
  has_many :doctors, through: :appointments


  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
end
