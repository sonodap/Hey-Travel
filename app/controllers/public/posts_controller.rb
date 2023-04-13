class Public::PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save!
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    @user = current_user
  end

  def show
  end

  def destroy
  end

  private

  def post_params
    # あとでジャンルも追加
    params.require(:post).permit(:title, :image, :post_text, :prefectures_genres)
  end

end
