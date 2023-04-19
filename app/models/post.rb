class Post < ApplicationRecord
  before_create -> { self.id = SecureRandom.uuid }
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :title,presence:true
  validates :post_text,presence:true,length:{maximum:200}
  validates :image, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample_post.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.looks(word)
    if word.present?
      @post = Post.where("title LIKE?","%#{word}%").or(Post.where("post_text LIKE?","%#{word}%"))
    else
      @post = Post.all
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  enum prefectures_genre: {
    hokkaido:0, aomori:1, iwate:2, miyagi:3, akita:4, yamagata:5, fukusima:6, ibaraki:7, tochigi:8, gunma:9, saitama:10, chiba:11, tokyo:12, kanagawa:13,
    niigata:14, toyama:15, ishikawa:16, hukui:17, yamanashi:18, nagano:19, gihu:20, shizuoka:21, aichi:22, mie:23, shiga:24, kyoto:25, osaka:26, hyogo:27, nara:28, wakayama:29,
    tottori:30, shimane:31, okayama:32, hiroshima:33, yamaguchi:34, tokushima:35, kagawa:36, ehime:37, kochi:38, fukuoka:39, saga:40, nagasaki:41, kumamoto:42,
    oita:43, miyazaki:44, kagoshima:45, okinawa:46
    }
end
