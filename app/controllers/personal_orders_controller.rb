class PersonalOrdersController < ApplicationController

  def new
    @personal_order = PersonalOrder.new
  end

  def create
    @personal_order = PersonalOrder.new(personal_order_params)
    if @personal_order.save
      flash[:notice] = 'saved!'
      redirect_to orders_path
    else
      flash[:notice] = 'error!'
      render('new');
    end
  end

  private

  def personal_order_params
    params.require(:personal_order).permit(:name, :price, :items)
  end

end
