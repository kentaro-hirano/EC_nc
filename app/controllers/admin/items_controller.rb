class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_paramas)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private
  def item_paramas
    params.require(:item).permit(:genre_id, :name, :explanation, :image, :price, :is_active)
  end
end