class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In"
      redirect_to orders_path
    else
      flash[:notice] = "Sorry, something you inputted didn't match up"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end

end
