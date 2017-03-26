class PerfilController < ApplicationController
	
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
	end
end
