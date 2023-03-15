class FriendshipsController < ApplicationController
  def index
    @user = current_user
  end
  
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
  
    if @friendship.save
      redirect_to User.find(user_id: params[:user_id])
    end
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friendship = Friendship.find(params[:id])
    return unless @friendship

    @friendship.accept
    if @friendship.update(friendship_params)
      redirect_to @friendship
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :id)
  end

end
