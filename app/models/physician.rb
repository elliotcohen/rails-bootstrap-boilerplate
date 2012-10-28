class Physician < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  attr_accessible :first_name, :last_name, :phone, :fax
end
