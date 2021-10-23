class Admins::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
  end
end



private

def order_params
   params.require(:order).permit(:order_status)
end