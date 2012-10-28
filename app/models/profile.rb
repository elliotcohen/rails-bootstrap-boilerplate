class Profile < ActiveRecord::Base

  belongs_to :user, inverse_of: :profile 
  has_one :address
  has_many :insurance
  
  attr_accessible :first_name, :last_name, :dob, :social
  validates_uniqueness_of :user_id
  
end
