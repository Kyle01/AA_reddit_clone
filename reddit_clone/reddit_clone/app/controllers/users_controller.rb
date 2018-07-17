class UsersController < ApplicationController
  
  def new
    render :new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      log_in(user)
      redirect_to new_session_url
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
  def show
    @user = User.find(params[:id])
  end
end
