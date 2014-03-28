class SessionsController < ApplicationController
	def new
		render 'new'
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			# Sign in the user and redirect to profile page
			sign_in user
			redirect_to user
		else
			# Redisplay page with error message
			flash.now[:danger] = 'Invalid email / password combination.'
			render 'new'
		end
	end

	def destroy
	end
end
