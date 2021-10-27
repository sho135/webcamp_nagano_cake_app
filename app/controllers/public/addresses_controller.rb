class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
  if @address.save
      flash[:notice] = "新規配送先を登録しました"
      redirect_to public_addresses_path
  end
  end

  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
  if @address.update(address_params)
    flash[:notice] = "配送先を編集しました"
    redirect_to public_addresses_path
  else
    render :edit
  end
  end

  def destroy

     @address = Address.find(params[:id])
     @address.destroy
     flash[:notice] = "配送先を削除しました"
  end


private

def address_params
  params.permit(:name, :postal_code, :address)
end


end
