class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    puts @order
    if @order.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Your order was created successfully."
      redirect_to(order_path(@order))
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:notice] = "All fields must be filled out"
      render('new')
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Cancelled your order!"
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:restaurant, :menu_url)
  end

end
