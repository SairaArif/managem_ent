class Doctor < ActiveRecord::Base
  attr_accessible :name, :qualification, :specialist, :patients, :attachments_attributes
   validates_uniqueness_of :name 

   has_many :appointments
  has_many :patients, through: :appointments 
  belongs_to :user
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments

define_index do
  indexes name
  
end

end
