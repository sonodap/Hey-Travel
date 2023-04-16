class Admin::SpotGenresController < ApplicationController
  def index
    @spot_genre = Spot_genre.new
    @spot_genres = Spot_genre.all
  end

  def create
    @spot_genre = Spot_genre.new(spot_genre_params)
    @spot_genre = save
    redirect_to admin_spot_genres_path
  end

  def edit
    @spot_genre = Spot_genre.find(params[:id])
  end

  def update
    @spot_genre = Spot_genre.fine(params[:id])
    @spot_genre.update(spot_genre_params)
    redirect_to admin_spot_genres_path
  end

  private

  def spot_genre_params
    params.require(:spot_genres).permit(:spot_genre)
  end
end
