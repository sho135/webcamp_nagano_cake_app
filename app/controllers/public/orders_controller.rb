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

  if params[:order][:select_option] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = full_name(current_customer)
  elsif params[:order][:select_option] == "1"
    @order.postal_code = Addrss.find(order_params[:customer]).postal_code
    @order.address = Addrss.find(order_params[:customer]).address
    @order.name = Addrss.find(order_params[:customer]).name
  elsif params[:order][:select_option] == "2"
    @order.customer_address = order_params[:customer_address]
    @order.customer_postal_code = order_params[:customer_postal_code]
    @order.customer_name = order_params[:customer_name]
  end
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_customer
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.price * cart_item.amount
      @order_detail.save
    end

    @cart_items.destroy_all

    redirect_to thanks_public_orders_path

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
