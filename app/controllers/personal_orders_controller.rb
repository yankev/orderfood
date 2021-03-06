class PersonalOrdersController < ApplicationController

  def index
    redirect_to order_path(params[:order_id])
  end

  def new
    @personal_order = PersonalOrder.new
    @parent_order = get_parent_order
  end

  def create
    @parent_order = get_parent_order
    @personal_order = PersonalOrder.new(personal_order_params)
    @personal_order.order_id = params[:order_id]
    @personal_order.user_id = current_user.id
    @personal_order.name = current_user.name
    if !@personal_order.valid?
      flash[:notice] = @personal_order.errors.full_messages;
      render :new
    else
      # the following is an adjustment on the price
      @personal_order.price = (@personal_order.price).round(2)
      if @personal_order.save
        flash[:notice] = 'saved!'
        redirect_to order_path(:id => params[:order_id])
      else
        flash[:notice] = @personal_order.errors.full_messages;
        render :new
      end
    end
  end

  def show
    @personal_order = PersonalOrder.new
    @order_ref = params[:id]
  end

  def destroy
    @remove_order = PersonalOrder.find(params[:order_id])
    @remove_order.destroy
    flash[:notice] = "Cancelled your order!"
    redirect_to order_path(:id => params[:id])
  end

  private

  def personal_order_params
    params.require(:personal_order).permit(:name, :price, :items)
  end

  def get_parent_order
    Order.find(params[:order_id])
  end

end
