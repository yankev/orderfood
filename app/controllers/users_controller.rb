class UsersController < ApplicationController

  def index
    redirect_to signup_path
  end

  def edit
  end

  def update
    if current_user.update(required_user_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(required_user_params)
    if @user.save
      flash[:notice] = "Great!"
      redirect_to login_path
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
