class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(post_id: params[:post_id], user_id: params[:user_id], content: params[:content])
    # redirect_to root_path
    if @comment.save
      redirect_to root_path
    else
      flash[:warning] = "Error: #{@comment.errors.full_messages.join}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content)
  end
end
