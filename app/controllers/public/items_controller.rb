class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end



  private

  def items_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image_id)
  end

end
