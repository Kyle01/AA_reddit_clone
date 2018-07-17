class PostsController < ApplicationController
  
  def index
  end
  
  def create
  end
  
  def new
  end
  
  def edit
    
  end
  
  def show
  end
  
  def update
  end
  
  def destroy
  end
  
  def posts_params
    params.require(:post).permit(:title, :url, :content)
  end
end
