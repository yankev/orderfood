class PersonalOrdersController < ApplicationController

  def index
  end

  def new
    @personal_order = PersonalOrder.new
  end

  def create
    @personal_order = PersonalOrder.new(personal_order_params)
    # add the referenced object id as well
    @personal_order.order_id = params[:order_id]
    @personal_order.user_id = current_user.id
    # params_with_order = .merge(:order_id => @)
    if @personal_order.save
      flash[:notice] = 'saved!'
      redirect_to order_path(:id => params[:order_id])
    else
      flash[:notice] = @personal_order.errors.full_messages;
      render :new
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

end
