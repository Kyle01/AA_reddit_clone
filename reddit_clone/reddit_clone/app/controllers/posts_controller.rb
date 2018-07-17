class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(posts_params)
    @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id
    if @post.save
      redirect_to sub_post_url(sub_id: @post.sub_id, id: @post.id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def new
    render :new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
  
  def posts_params
    params.require(:post).permit(:title, :url, :content)
  end
end
