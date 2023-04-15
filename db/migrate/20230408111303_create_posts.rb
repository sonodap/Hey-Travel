class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts, id: :string, limit:36 do |t|
      t.text :post_text, null: false
      t.integer :prefectures_genre, null: false

      t.timestamps
    end
  end
end
