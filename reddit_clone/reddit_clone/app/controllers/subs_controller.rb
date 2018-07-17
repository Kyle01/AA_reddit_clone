class SubsController < ApplicationController
  before_action :require_login, only: [:update, :edit, :subscribe]
  
  def index
    @subs = Sub.all
  end
  
  def create
    @sub = Sub.create(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_session_url
    end
  end
  
  def new
    render :new
  end
  
  def edit
    render :new
  end
  
  def show
    @sub = Sub.find(params[:id])
  end
  
  def update
    @sub = Sub.find(params[:id])
    @sub.update_attributes(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to sub_url(@sub)
    end
  end
  
  def destroy
  end
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
  def subscribe
    subuser = SubsUser.new(user_id: current_user.id, sub_id: params[:sub_id])
    if subuser.save
      redirect_to sub_url(params[:sub_id])
    else
      flash[:errors] = subuser.errors.full_messages
      redirect_to sub_url(params[:sub_id])
    end
  end
end
