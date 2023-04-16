class Admin::SpotGenresController < ApplicationController
  def index
    @spot_genre = SpotGenre.new
    @spot_genres = SpotGenre.all
  end

  def create
    @spot_genre = SpotGenre.new(spot_genre_params)
    @spot_genre.save
    redirect_to admin_spot_genres_path
  end

  def edit
    @spot_genre = SpotGenre.find(params[:id])
  end

  def update
    @spot_genre = SpotGenre.find(params[:id])
    @spot_genre.update(spot_genre_params)
    redirect_to admin_spot_genres_path
  end

  def destroy
    @spot_genre = SpotGenre.find(params[:id])
    @spot_genre.destroy
    redirect_to admin_spot_genres_path
  end

  private

  def spot_genre_params
    params.require(:spot_genre).permit(:spot_genre)
  end
end
