class HomeController < ApplicationController
  def index
    flash.keep

    if current_user
      redirect_to '/dashboard' if current_user
    else
      redirect_to '/log_in'
    end

  end
end
