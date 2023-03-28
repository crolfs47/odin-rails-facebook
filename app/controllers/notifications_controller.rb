class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user: current_user)
  end

  def mark_as_read
    # add if statement for friendship/like/comment instead of having it in views
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    if @notification.action == 'friendship'
      requestor = Friendship.find(@notification.notifiable_id).user
      redirect_to user_path(requestor)
    elsif @notification.action == 'like'
      @post_id = Like.find(@notification.notifiable_id).post.id
      redirect_to post_path(@post_id)
    elsif @notification.action == 'comment'
      @post_id = Comment.find(@notification.notifiable_id).post.id
      redirect_to post_path(@post_id)
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:id)
  end
end
