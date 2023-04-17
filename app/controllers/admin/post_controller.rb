class Admin::PostController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @spot_genres = SpotGenre.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_homes_top_path
  end
end
