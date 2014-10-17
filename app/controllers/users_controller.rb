class UsersController < ApplicationController
  
  def show   
    @user = !params[:id].nil? ? User.find(params[:id]) : current_user  
  end

  protected

  def load_user  
    @user = !params[:id].nil? ? User.find(params[:id]) : current_user
  end

  def redirect_if_no_user
    redirect_to new_user_session_path if !@user
  end

end