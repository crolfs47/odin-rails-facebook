class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
