class Admins::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if item.save
      redirect_to admins_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = item.find(params[:id])
  end

  def edit
    @item = item.find(params[:id])
  end

  def update
    @item = item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :item_name, :image_id, :introduction, :price, :is_active)
  end

end
