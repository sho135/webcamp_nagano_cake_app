class Admins::OrdersDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    redirect_to admins_order_path(@order_detail.order)

  if @order_detail.making_status == "製作中"
    @order.update(status: 2)
    @order.save
  end

  if @order.order_details == @order.order_details.where(making_status: 3)
    @order.update(status: 3)
    @order.save
  end
  end




private

def order_detail_params
  params.require(:order_detail).permit(:order_id, :making_status, :amount)
end

end
