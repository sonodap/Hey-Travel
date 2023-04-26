class Public::UsersController < ApplicationController

  before_action :authenticate_admin_or_user!
  before_action :ensure_guest_user, only: [:edit]

  def mypage
   @user = current_user
   @posts = current_user.posts.page(params[:page]).order(created_at: :desc)
   @spot_genres = SpotGenre.all
   if params[:spot_genre_id]
     @spot_genre = SpotGenre.find(params[:spot_genre_id])
     @posts = @spot_genre.posts.all
   end
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @posts = Kaminari.paginate_array(Post.find(favorites)).page(params[:page])
    @user = current_user
    @spot_genres = SpotGenre.all
  end

  def user_page
   @user = User.find(params[:id])
   @posts = @user.posts.page(params[:page]).order(created_at: :desc)
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
      @user = current_user
      @user.update(is_deleted: true)
      reset_session
      redirect_to root_path, notice: "退会処理が完了しました。ご利用ありがとうございました"
  end

  private


  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to mypage_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
