class LikesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(post_id: params[:post_id], user_id: params[:user_id])
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.find_like(current_user)
    @like.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
