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
    # params_with_order = .merge(:order_id => @)
    if @personal_order.save
      flash[:notice] = 'saved!'
      redirect_to orders_path
    else
      flash[:notice] = @personal_order.errors.full_messages;
      render :new
    end
  end

  def show
    @personal_order = PersonalOrder.new
    @order_ref = params[:id]
  end

  private

  def personal_order_params
    params.require(:personal_order).permit(:name, :price, :items)
  end

end
