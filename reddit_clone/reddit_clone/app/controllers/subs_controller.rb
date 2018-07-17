class SubsController < ApplicationController
  before_action :require_login, only: [:update, :edit]
  
  def index
    @subs = Subs.all
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
    @sub = Sub.find_by(params[:id])
  end
  
  def update
    @sub = Sub.find_by(params[:id])
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
end
