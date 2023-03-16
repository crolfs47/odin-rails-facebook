class NotificationsController < ApplicationController
  def index
    @user = current_user
    @notifications = Notification.where(user: current_user)
  end
end
