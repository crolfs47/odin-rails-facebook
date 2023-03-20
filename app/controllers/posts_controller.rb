class PostsController < ApplicationController
  def index
    # @posts = Post.all.order(created_at: :desc)
    @posts = Post.where(user_id: current_user.id)
                 .or(Post.where(user_id: current_user.friends.pluck(:id)))
                 .order(created_at: :desc)
    @post = Post.new
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    redirect_to root_path
    if @post.save
      flash[:notice] = "New post created."
    else
      flash[:warning] = "Error: #{@post.errors.full_messages.join}"
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
