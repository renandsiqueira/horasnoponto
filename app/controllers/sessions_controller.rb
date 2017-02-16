class SessionsController < ApplicationController
  def create
  	auth = request.env['omniauth.auth']
  	unless @auth = Authorization.find_from_hash(auth)
    	# Create a new user or add an auth to existing user, depending on
    	# whether there is already a user signed in.
    	@auth = Authorization.create_from_hash(auth, current_user)
  	end
  	# Log the authorizing user in.
    #session[:user_id] = @auth.user.id 
    set_current_user = @auth.user
    #set_current_user = @auth.user 

  	render :text => "Welcome, #{current_user.email}."
  end

  def destroy
    reset_session
    render :text => "Logout."
  end
end
