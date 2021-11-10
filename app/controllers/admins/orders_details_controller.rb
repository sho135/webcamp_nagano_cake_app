class Admins::OrdersDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admins_order_path(@order_detail.order)
  end




private

def order_detail_params
  params.require(:order_detail).permit(:order_id, :making_status, :amount)
end

end
