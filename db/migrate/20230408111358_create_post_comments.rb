class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.string :post_comment, null: false

      t.timestamps
    end
  end
end
