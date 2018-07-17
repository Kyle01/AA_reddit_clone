class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to sub_post_url(sub_id: Post.find(@comment.post_id).sub_id, id: @comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end
  
  def index
    @comments = Comment.all
  end
  
  def new
    render :new
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to sub_post_url(sub_id: Post.find(@comment.post_id).sub_id, id: @comment.post_id)
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
