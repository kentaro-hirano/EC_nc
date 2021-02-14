class EndUser::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    @update_cart_item = CartItem.find_by(item_id: @cart_item.item_id)
    
    if @update_cart_item.present?
      @cart_item.amount += @update_cart_item.amount
      @update_cart_item.destroy
    end
    
    @cart_item.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
