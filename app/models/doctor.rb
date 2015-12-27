class Doctor < ActiveRecord::Base
  attr_accessible :name, :qualification, :specialist, :patients, :attachments_attributes
   validates_uniqueness_of :name 
  has_many :patients 
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
end
