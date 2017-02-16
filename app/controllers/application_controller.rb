class ApplicationController < ActionController::Base
  #http://railscasts.com/episodes/250-authentication-from-scratch
  private
  	
    def current_user
    	@current_user ||= User.find_by_id(session[:user_id])
  	end

  	def signed_in?
    	!!current_user
  	end

  	helper_method :current_user, :signed_in?

  	def current_user=(user)
    	@current_user = user
    	session[:user_id] = user.id
  	end

    def auth!
      redirect_to root_url, :notice => "Informe seu login para gerenciar seus produtos" unless signed_in?
    end
end
