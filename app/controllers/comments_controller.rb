class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(post_id: params[:post_id], user_id: params[:user_id], content: params[:content])
    redirect_back_or_to root_path
    if @comment.save
      flash[:notice] = 'New comment created.'
      Notification.create(user_id: @post.user_id, notifiable: @comment, action: 'comment')
    else
      flash[:warning] = "Error: #{@comment.errors.full_messages.join}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_back_or_to root_path, status: :see_other
    flash[:notice] = 'Comment successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content)
  end
end
