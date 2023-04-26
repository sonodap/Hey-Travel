class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).order(created_at: :desc)
    @spot_genres = SpotGenre.all
  end

  def index
    @users = User.page(params[:page])
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admin_users_path, notice: "退会処理が完了しました。"
  end
end
