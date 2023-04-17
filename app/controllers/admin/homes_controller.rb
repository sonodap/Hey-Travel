class Admin::HomesController < ApplicationController
  def top
    @posts = Post.all.page params[:page]
    @spot_genres = SpotGenre.all
  end
end
