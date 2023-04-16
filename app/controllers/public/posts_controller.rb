class Public::PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    @user = current_user
    @spot_genres = SpotGenre.all
    if params[:spot_genre_id]
     @spot_genre = SpotGenre.find(params[:spot_genre_id])
     @posts = @spot_genre.posts.all
    end
    if params[:prefectures_genre]
      @posts = @posts.where(prefectures_genre: params[:prefectures_genre])
    end
  end

  def show
    @post = Post.find(params[:id])
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
