class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @spot_genres = SpotGenre.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = '投稿の削除に成功しました'
    redirect_to admin_homes_top_path
  end
end
