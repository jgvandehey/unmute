class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    @likes = @user.posts(:votes)
  end

  def edit
    @user = User.find(current_user.id)
  end
  def update
    @user = User.find(current_user.id)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Account updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  protected

  def load_user  
    @user = !params[:id].nil? ? User.find(params[:id]) : current_user
  end

  # def redirect_if_no_user
  #   redirect_to new_user_session_path if !@user
  # end

end