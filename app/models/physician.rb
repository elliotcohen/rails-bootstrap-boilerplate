class Physician < ActiveRecord::Base
  belongs_to :users
  
  attr_accessible :first_name, :last_name, :phone, :fax
end
