class EndUser::OrdersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :check_cart_item, except: :complete

  def new
    @order = Order.new
    # binding.pry
    @addresses = Address.where(end_user_id: current_end_user.id)
  end

  def confirm
    # binding.pry
    @cart_items = current_end_user.cart_items
    @order = Order.new(payment_method: params[:order][:payment_method])

    if params[:order][:address_option] == "0"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
      if params[:point] == "true"
        @order.total_price = total_price(@cart_items) - @order.end_user.point
      elsif
        @order.total_price = total_price(@cart_items)
      end
    elsif params[:order][:address_option] == "1"
      @ship = Address.find(params[:order][:address_id])
      @order.postal_code = @ship.postal_code
      @order.address = @ship.address
      @order.name = @ship.name
      @order.total_price = total_price(@cart_items)
    elsif params[:order][:address_option] = "2"
      binding.pry
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.total_price = total_price(@cart_items)
    end
  end

  def create
    @order = current_end_user.orders.new(order_params)
    @order.save
    @cart_items = current_end_user.cart_items
    # if @order.total_price != total_price(@cart_items)
    #   current_end_user.update(point: 0)
    # end
    # # binding.pry
    # @point = current_end_user.point
    # if @order.total_price >= 3000
    #   @point += 10
    # elsif @order.total_price >= 1000 && @order.total_price < 3000
    #   @point += 5
    # end
    # current_end_user.point = @point
    # current_end_user.save
    current_end_user.addresses.create(address_params)
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

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  def check_cart_item
   unless current_end_user.cart_items.present?
     redirect_to cart_items_path
   end
  end

end
