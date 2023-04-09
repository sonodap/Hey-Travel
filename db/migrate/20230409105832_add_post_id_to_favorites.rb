class AddPostIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :post_id, :intger
  end
end
