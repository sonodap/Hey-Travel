class Admin::HomesController < ApplicationController
  def top
    @posts = Post.includes(:user).where(users: {is_deleted: false}).page(params[:page])
    @spot_genres = SpotGenre.all
  end
end
