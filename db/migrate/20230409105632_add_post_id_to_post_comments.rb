class AddPostIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :post_id, :intger
  end
end
