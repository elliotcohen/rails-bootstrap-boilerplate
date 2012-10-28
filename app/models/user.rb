class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  # 
  devise :database_authenticatable, :trackable, :rememberable, :registerable, :trackable, :recoverable

  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes
  
  has_one :profile, inverse_of: :user
  has_and_belongs_to_many :physicians
  after_create :create_profile, :unless => Proc.new {|record| record.profile.present?}
  accepts_nested_attributes_for :profile
  
end
