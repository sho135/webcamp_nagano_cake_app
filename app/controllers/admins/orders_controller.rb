class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_order_path(@order)

  if @order.status == "入金確認"
    @order.order_details.each do |order_detail|
      order_detail.update(making_status: 1)
    end
  end
  end
end



private

def order_params
   params.require(:order).permit(:name, :address, :postal_code, :payment_method, :status, :making_status)
end