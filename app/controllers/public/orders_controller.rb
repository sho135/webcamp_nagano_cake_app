class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
  end

  def thanks
  end



  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end



private

def order_params
  params.permit(:customer_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method, :order_status)
end

def address_params
  params.permit(:name, :postal_code, :address)
end

end
