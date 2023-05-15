class UsersController < ApplicationController
  def index
    @users = User.all.order(full_name: :asc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @events = @user.attended_events
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :location, :college, :high_school, :occupation, :birthday, :avatar)
  end

end
