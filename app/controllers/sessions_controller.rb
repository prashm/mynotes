class SessionsController < ApplicationController

  skip_before_filter :authenticate_user!

  def new
  end

  def create
    user = User.authenticate(params[:uname], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
