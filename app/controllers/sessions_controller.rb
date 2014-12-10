class SessionsController < ApplicationController
	def home
		if !logged_in?
			render :home
		elsif logged_in?
			redirect_to profiles_path
		end
	end

	def create
		#probably have to change the env when get omniauth working
		user = User.from_omniauth(env["omniauth.auth"])
    	set_logged_in_userid(user.id)
	end

	def test_login
		user = Profile.from_fakeuser(params[:firstname])
		set_logged_in_userid user.id
		user.save!
	end

	def set_logged_in_userid id
		session[:user_id] = id
		redirect_to profiles_path(id), notice: "Signed in."
	end

	def log_out
		session[:user_id] = nil
		redirect_to projects_path notice; "Logged out"
	end
end

