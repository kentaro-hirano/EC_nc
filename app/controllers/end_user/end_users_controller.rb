class EndUser::EndUsersController < ApplicationController
  
  def top
  end
  
  def show
    @end_user = current_end_user
  end
  
  def edit
    @end_user = current_end_user
  end
  
  def update
    @end_user = current_end_user
    @end_user.update(end_user_params)
    flash[:success] = "会員情報を更新しました"
    redirect_to end_user_path(current_end_user)
  end
  
  private
  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :addrees, :phone_number)
  end
  
  
end
