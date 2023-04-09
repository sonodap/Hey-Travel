class CreateSpotGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :spot_genres do |t|
      t.string :spot_genre, null: false

      t.timestamps
    end
  end
end
