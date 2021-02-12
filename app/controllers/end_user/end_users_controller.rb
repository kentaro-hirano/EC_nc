class EndUser::EndUsersController < ApplicationController
  
  def top
  end
  
  def show
    @end_user = current_end_user
  end
end
