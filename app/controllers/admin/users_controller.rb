class Admin::UsersController < ApplicationController

  def show
    @posts = @user.post.page(params[:page])
    @user = User.find(params[:id])
    @spot_genres = SpotGenre.all
  end

  def index
    @users = User.page(params[:page])
  end

  def unsubscribe
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    flash[:notice] =　"退会処理が完了しました。"
    reset_session
    redirect_to admin_homes_top_path
  end

  def withdraw
  end
end
