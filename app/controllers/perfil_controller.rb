class PerfilController < ApplicationController
	before_action :auth!, only: [:edit, :update]

	# GET /perfil
	def edit
		@current_user = current_user
	end

	# POST /perfil/update
	def update
		user_edit = params[:user]
		time_zone = user_edit[:time_zone]

		u = User.find(current_user.id)
		u.time_zone = time_zone
		u.save()

		redirect_to url_for(:controller => :perfil, :action => :edit)
	end
end
