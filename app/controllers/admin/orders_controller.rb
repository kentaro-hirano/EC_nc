class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    binding.pry
    @order.update(order_params)
    flash[:success] = "注文ステータスを更新しました"
    redirect_to admin_order_path(@order)
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
