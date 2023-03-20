class PostsController < ApplicationController
  def index
    @posts = Post.all
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
