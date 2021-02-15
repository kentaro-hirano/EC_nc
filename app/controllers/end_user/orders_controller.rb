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

    if params[:order][:address_option] == "0"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
      @order.total_price = total_price(@cart_items)
    elsif params[:order][:address_option] == "1"
      @ship = Address.find(params[:order][:address_id])
      @order.postal_code = @ship.postal_code
      @order.address = @ship.address
      @order.name = @ship.name
      @order.total_price = total_price(@cart_items)
    elsif params[:order][:address_option] = "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @order.total_price = total_price(@cart_items)
      current_end_user.addresses.create(address_params)
    end
  end

  def create    
    @order = current_end_user.orders.new(order_params)
    @order.save
    @cart_items = current_end_user.cart_items
    @cart_items.each do |cart_item| 
      OrderDetail.create(
        item_id: cart_item.item.id,
        order_id: @order.id,
        amount: cart_item.amount,
        price: cart_item.item.price
      )
    end
    @cart_items.destroy_all
    redirect_to complete_orders_path
  end
    private
    def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price)
    end

    def address_params
      params.require(:order).permit(:postal_code, :address, :name)
    end

end
