class Address < ActiveRecord::Base
  belongs_to :user, :inverse_of :address
  
  attr_accessible :street, :street2, :city, :state, :zipcode
end