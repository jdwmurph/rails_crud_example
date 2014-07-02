class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @note = Note.new
  end

  def edit
  end

  def create
    User.create(user_params)
    redirect_to login_path
  end

  def update
    user = User.find(current_user)
    user.update(user_params)
    redirect_to user_path(current_user)
  end

  def destroy
    logout
    User.delete(params[:id])
    redirect_to '/users'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
