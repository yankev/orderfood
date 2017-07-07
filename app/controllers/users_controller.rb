class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(required_user_params)
    if @user.save
      flash[:notice] = "Great!"
      redirect_to users_path
    else
      flash[:notice] = "Error"
      render :new
    end
  end

  private

  def required_user_params
    params.require(:user).permit(:email, :name, :password)
  end

end
