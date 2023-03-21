class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(post_id: params[:post_id], user_id: params[:user_id])
    redirect_to root_path
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
