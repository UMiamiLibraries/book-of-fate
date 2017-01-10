class AdminController < ApplicationController
    before_action :logged_in_user
    layout "admin"

  private

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
