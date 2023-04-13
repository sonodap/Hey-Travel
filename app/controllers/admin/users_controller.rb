class Admin::UsersController < ApplicationController
  def show
  end

  def index
    @users = User.all.page params[:page]
  end

  def unsubscribe
  end

  def withdraw
  end
end
