class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def comfirm
  end

  def thanks
  end

  def create
  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end


private

def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method, :order_status)
end


end
