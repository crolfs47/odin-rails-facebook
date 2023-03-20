class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user: current_user)
  end

  def mark_as_read
    # add if statement for friendship/like/comment instead of having it in views
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    redirect_to user_friendships_path(current_user)
  end

  private
  def notification_params
    params.require(:notification).permit(:id)
  end
end
