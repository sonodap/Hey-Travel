class Public::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit,:update]

  def show
    @user = User.find(params)[:id]
    @posts = @user.posts
  end

  def edit
    @user = User.find(params)[:id]
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "会員情報が更新されました"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    def withdraw
      @user = current_customer
      @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :gender)
  end

  # 他ユーザーの編集をさせない
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
