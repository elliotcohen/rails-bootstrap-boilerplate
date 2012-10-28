class Insurance < ActiveRecord::Base
  belongs_to :user
  has_attached_file :front_photo, 
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'minda_insurance_images'
  
  has_attached_file :back_photo,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'minda_insurance_images'
    
  attr_accessible :bin, :pcn, :id_number
end