class Public::PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "旅の投稿に成功しました！"
      redirect_to posts_path
    else
      flash[:notice] = "投稿に失敗しました、必要入力事項をもう一度確認してください"
      render :new
    end
  end

  def index
    @posts = Post.includes(:user).where(users: {is_deleted: false}).page(params[:page])
    @user = current_user
    @spot_genres = SpotGenre.all
    if params[:spot_genre_id]
     @spot_genre = SpotGenre.find(params[:spot_genre_id])
     @posts = @spot_genre.posts.includes(:user).where(users: {is_deleted: false}).page(params[:page])
    end
    if params[:prefectures_genre]
      @posts = @posts.where(prefectures_genre: params[:prefectures_genre])
    end
  end

  def show
    if params[:format]
      @post = Post.find(params[:format])
    else
      @post = Post.find(params[:id])
    end
    @post_comment = PostComment.new
    @user = @post.user
    @spot_genres = SpotGenre.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to mypage_path
  end

  private

  def post_params
    # あとでジャンルも追加
    params.require(:post).permit(:title, :image, :post_text, :prefectures_genre, :spot_genre_id)
  end



end
