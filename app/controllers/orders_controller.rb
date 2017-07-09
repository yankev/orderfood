class OrdersController < ApplicationController

  before_action :authenticate_user

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
    @order.user_id = current_user.id
    @order.ordered = false
    # adjust the prices
    # @modified_p_orders = @order.personal_orders
    # @modified_p_orders.each do |p_order|
    #   p_order.price = p_order.price * (1 + (@order.tax.to_f + @order.tip.to_f) / 100)
    # end
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

  def update
    @order = Order.find(params[:id])
    @order.ordered = true
    if @order.save
      flash[:notice] = "The order has been confirmed."
      redirect_to(order_path(@order))
    else
      flash[:notice] = "Something happened and the order was not confirmed."
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
    params.require(:order).permit(:restaurant, :menu_url, :tip, :tax)
  end

end
