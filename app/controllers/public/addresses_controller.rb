class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
  end

  def update
    @address = Address.find(params[:id])
  end

  def destroy
  end


private

def address_params
  params.require(:address).permit(:customer_id, :name, :postal_code, :address)
end


end
