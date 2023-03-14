class FriendshipsController < ApplicationController
  def index
    @user = current_user
  end
  
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
  
    if @friendship.save
      redirect_to User.find(@friendship.friend_id)
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end

end
