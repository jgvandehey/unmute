class ApplicationController < ActionController::Base
  protect_from_forgery
  def redirect_if_no_user
    redirect_to '/auth/twitter' if !current_user
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
