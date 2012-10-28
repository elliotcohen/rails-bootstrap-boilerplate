class RegistrationsController < Devise::RegistrationsController

  def new
    begin
      u = User.new
    rescue Exception => e
      logger.log e
      raise "kill"
    end
  end
  
end