class EndUser::FavoritesController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    favorite = current_end_user.favorites.new(item_id: item.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = Favorite.find_by(item_id: item.id)
    favorite.destroy
    if params[:favorite_id] == "2"
      flash[:success] = "お気に入りリストから削除しました"
      redirect_back(fallback_location: root_path)
    else 
      redirect_back(fallback_location: root_path)
    end
  end
end