class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!


  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @sarch_cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
    if @sarch_cart_item.present?
      @sarch_cart_item.amount += @cart_item.amount
      @sarch_cart_item.save
      redirect_to public_cart_items_path
    else
      if @cart_item.save
        redirect_to public_cart_items_path
      end
    end
  end

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end



  private

def cart_item_params
  params.require(:cart_item).permit(:amount, :item_id)
end


end
