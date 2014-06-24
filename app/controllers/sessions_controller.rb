class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # log in / create session
      session[:user_id] = user.id
      redirect_to root_url, notice: "Successfully logged in!"
    else
      flash.now[:alert] = "Please log in"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
