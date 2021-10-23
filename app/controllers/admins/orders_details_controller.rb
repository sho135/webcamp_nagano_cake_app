class Admins::OrdersDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
  end


end
