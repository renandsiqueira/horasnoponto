class ApplicationController < ActionController::Base
  #http://railscasts.com/episodes/250-authentication-from-scratch
  protected
  	
    def current_user
    	@current_user ||= User.find_by_id(session[:user_id])
  	end

  	def signed_in?
    	!!current_user
  	end

  	helper_method :current_user, :signed_in?

    def auth!
      redirect_to root_url, :notice => "Informe seu login!" unless signed_in?
    end
end
