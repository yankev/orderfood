class PersonalOrdersController < ApplicationController

  def new
    @personal_order = PersonalOrder.new
  end

end
