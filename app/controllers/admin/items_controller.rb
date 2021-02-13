class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_paramas)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
  end
  
  private
  def item_paramas
    params.require(:item).permit(:genre_id, :name, :explanation, :image, :price, :is_active)
  end
end
