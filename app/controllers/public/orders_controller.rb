class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @order.shipping_fee = 800
    @sum = 0

  if params[:order][:select_option] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
  elsif params[:order][:select_option] == "1"
    address = Address.find(params[:address][:id])
    @order.postal_code = address.postal_code
    @order.address = address.address
    @order.name = address.name
  elsif params[:order][:select_option] == "2"
    @address = Address.new
    @address.address = params[:order][:address]
    @address.postal_code = params[:order][:postal_code]
    @address.name = params[:order][:name]
    @address.customer_id = current_customer.id
    if @address.save
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      render :new
    end
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
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
    @order_details.each do |order_detail|
      @sum += order_detail.item.with_tax_price*order_detail.amount
    end
  end



private

def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method)
end

def address_params
  params.require(:address).permit(:name, :postal_code, :address)
end

end
