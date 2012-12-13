class Profile < ActiveRecord::Base

  belongs_to :user, inverse_of: :profile 
  
  attr_accessible :first_name, :last_name, :dob, :social, :street, :street2, :city, :state, :zipcode
  validates_uniqueness_of :user_id
  
end
