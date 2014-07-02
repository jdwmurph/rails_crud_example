class SessionsController < ApplicationController

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to '/sessions/new'
  end

end
