class EndUser::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.where(end_user_id: current_end_user.id)
  end

  def confirm
    @cart_items = current_end_user.cart_items
    @order = Order.new(
    end_user: current_end_user,
    payment_method: params[:order][:payment_method]
    )

    if params[:order][:address_option] == 0
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
    # elsif params[:order][:address_option] == "1"
    #   ship = Address.find(params[:order][:address_id])
    #   @order.postal_code = ship.postal_code
    #   @order.address = ship.address

    end
    binding.pry

    private
    def order_params
        params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price, :address_id)
    end

  end
end
