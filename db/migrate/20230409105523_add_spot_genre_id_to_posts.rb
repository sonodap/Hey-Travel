class AddSpotGenreIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :spot_genre_id, :integer
  end
end
