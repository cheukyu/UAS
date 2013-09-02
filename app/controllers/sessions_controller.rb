class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(name: params[:session][:name])
		if user && user.authenticate(params[:session][:password])
			#Sign in to the admin page
			sign_in user
			redirect_to user
		else
      		flash.now[:error] = 'Invalid name/password combination' # Not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

	def set_daylightsaving
      current_user.update_attribute(:daylight, true)
      redirect_to :back
  	end

  	def set_not_daylightsaving
      current_user.update_attribute(:daylight, false)
      redirect_to :back     
  	end
end
