class Public::UsersController < ApplicationController

  before_action :authenticate_user!
  # before_action :ensure_guest_user, only: [:edit]
  # before_action :ensure_correct_user, only: [:edit,:update]

  def mypage
   @user = current_user
   @posts = current_user.posts
   @spot_genres = SpotGenre.all
   if params[:spot_genre_id]
     @spot_genre = SpotGenre.find(params[:spot_genre_id])
     @posts = @spot_genre.posts.all
   end
  end

  def user_page
   @user = User.find(params[:id])
   @posts = @user.posts
   @spot_genres = SpotGenre.all
   if params[:spot_genre_id]
     @spot_genre = SpotGenre.find(params[:spot_genre_id])
     @posts = @spot_genre.posts.all
   end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "会員情報が更新されました"
      redirect_to mypage_path
    else
      flash[:notice] = "会員情報の更新に失敗しました"
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    def withdraw
      @user = current_user
      @user.update(is_deleted: true)
      flash[:notice] =　"退会処理が完了しました。ご利用ありがとうございました"
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
  
  # def ensure_guest_user
  #   @user = User.find(params[:id])
  #   if @user.name == "guestuser"
  #     redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
  #   end
  # end  
end
