class Admin::UsersController < ApplicationController

  def show
    @posts = @user.posts
    @user = current_user
  end

  def index
    @users = User.all.page params[:page]
  end

  def unsubscribe
  end

  def withdraw
  end
end
