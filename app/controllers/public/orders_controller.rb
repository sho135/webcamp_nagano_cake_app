class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def comfirm
  end

  def thanks
  end

  def create
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end


private

def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method, :order_status)
end


end
