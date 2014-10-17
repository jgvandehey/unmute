class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per_page(20)
  end

  protected

  def load_user  
    @user = !params[:id].nil? ? User.find(params[:id]) : current_user
  end

  # def redirect_if_no_user
  #   redirect_to new_user_session_path if !@user
  # end

end