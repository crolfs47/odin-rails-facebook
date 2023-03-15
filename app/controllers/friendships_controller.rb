class FriendshipsController < ApplicationController
  def index
    @user = current_user
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    return unless @friendship.save

    redirect_to User.find(params[:friend_id])
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friendship = Friendship.find(params[:id])
    
    return unless @friendship
    
    if @friendship.accept
      flash[:notice] = 'Friendship Confirmed'
      redirect_to user_friendships_path(current_user)
    else
      flash[:warning] = 'Something went wrong'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    redirect_to user_friendships_path(current_user), status: :see_other
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :id)
  end
end
