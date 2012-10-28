class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to '/dashboard/show'
    end
  end

end
