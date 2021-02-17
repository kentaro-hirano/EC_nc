class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    flash[:success] = "会員情報を更新しました"
    redirect_to admin_end_user_path(@end_user)
  end
  
  def end_user_orders
    @end_user = EndUser.find(params[:id])
  end

  private
  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :addrees, :email, :is_vaild)
  end
end

