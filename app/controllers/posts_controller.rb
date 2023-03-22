class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
                 .or(Post.where(user_id: current_user.friends.pluck(:id)))
                 .order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    redirect_to root_path
    if @post.save
      flash[:notice] = 'New post created.'
    else
      flash[:warning] = "Error: #{@post.errors.full_messages.join}"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
    flash[:notice] = 'Post successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
