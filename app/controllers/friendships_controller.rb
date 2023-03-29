class FriendshipsController < ApplicationController
  def index
    @user = current_user
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    return unless @friendship.save

    Notification.create(user_id: params[:friend_id], notifiable: @friendship, action: 'friendship')
    redirect_back_or_to root_path
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friendship = Friendship.find(params[:id])
    return unless @friendship
    
    if @friendship.accept
      flash[:notice] = 'Friendship Confirmed'
      Notification.find_by(notifiable: @friendship).update(read: true)
      redirect_back_or_to root_path
    else
      flash[:warning] = 'Something went wrong'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    redirect_back_or_to root_path, status: :see_other
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :id)
  end



end
