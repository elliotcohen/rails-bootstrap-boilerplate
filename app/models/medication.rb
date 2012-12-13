class Medication < ActiveRecord::Base
  has_and_belongs_to_many :orders
  
  attr_accessible :name, :dose
end