class ApplicationController < ActionController::Base
	before_filter :disable_nav, only: [:home, :about]  #hiding nav on certain pages re: http://stackoverflow.com/questions/13395153/how-to-render-partial-on-everything-except-a-certain-action
	protect_from_forgery
	def redirect_if_no_user
		redirect_to '/auth/twitter' if !current_user
	end

	def disable_nav
		@disable_nav = true
	end

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
end
