# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@example.com',
  password: 'adminn',
  )

users = User.create!(
  [
    {email: 'i.yamada@example.com', name: '山田　一郎', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/default.icon.jpg"), filename:"default.icon.jpg")},
    {email: 'j.tanaka@example.com', name: '田中　二郎', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_icon2.jpg"), filename:"sample_icon2.jpg")},
    {email: 's.yoshida@example.com', name: '吉田　三郎', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_icon3.jpg"), filename:"sample-_icon3.jpg")},
    {email: 's.kaneko@example.com', name: '金子　四郎', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_icon4.jpg"), filename:"sample-_icon4.jpg")},
    {email: 'g.suzuki@example.com', name: '鈴木　五郎', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_icon5.jpg"), filename:"sample-_icon5.jpg")}
  ]
)

spot_genres = SpotGenre.create!(
  [
    {spot_genre: '飲食店'},
    {spot_genre: '観光地'},
    {spot_genre: '遊園地'},
    {spot_genre: '神社・お寺'},
    {spot_genre: '山'},
    {spot_genre: '風景'},
    {spot_genre: '食べ歩き'}
  ]

)

Post.create!(
  [
    {title: '船で家族旅行', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post1.jpg"), filename:"sample_post1.jpg"),prefectures_genre: Post.prefectures_genres["tokyo"], spot_genre_id: spot_genres[1].id, post_text: '今日は家族みんなで船で東京湾をクルーズしてきました。海がとても綺麗でした', user_id: users[0].id },
    {title: 'バスで那須にイチゴ狩り', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post2.jpg"), filename:"sample_post2.jpg"),prefectures_genre: Post.prefectures_genres["tochigi"], spot_genre_id: spot_genres[1].id, post_text: '今年もバスで栃木の那須にイチゴ狩りへ行けました、美味しかったです！', user_id: users[1].id },
    {title: '京都でお寺巡り', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post3.jpg"), filename:"sample_post3.jpg"),prefectures_genre: Post.prefectures_genres["kyoto"], spot_genre_id: spot_genres[3].id, post_text: '京都にあるお寺と神社巡りをしてきました。', user_id: users[1].id },
    {title: '富士山の写真', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post4.jpg"), filename:"sample_post4.jpg"),prefectures_genre: Post.prefectures_genres["shizuoka"], spot_genre_id: spot_genres[5].id, post_text: '今年も富士山に雪が積もりました。', user_id: users[2].id },
    {title: '小樽の風景', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post5.jpg"), filename:"sample_post5.jpg"),prefectures_genre: Post.prefectures_genres["hokkaido"], spot_genre_id: spot_genres[1].id, post_text: '初めて小樽に行きました。とても落ち着いた場所でのんびりできました。', user_id: users[4].id },
    {title: '阿蘇山に登ってきました', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post6.jpg"), filename:"sample_post6.jpg"),prefectures_genre: Post.prefectures_genres["kumamoto"], spot_genre_id: spot_genres[4].id, post_text: '天気もよく、とても見晴らしが良く楽しかったです。', user_id: users[4].id },
    {title: '沖縄旅行', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post7.jpg"), filename:"sample_post7.jpg"),prefectures_genre: Post.prefectures_genres["okinawa"], spot_genre_id: spot_genres[1].id, post_text: '沖縄の文化に触れることができてとてもいい経験になりました', user_id: users[3].id },
    {title: '鹿がいっぱい', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post8.jpg"), filename:"sample_post8.jpg"),prefectures_genre: Post.prefectures_genres["nara"], spot_genre_id: spot_genres[1].id, post_text: '奈良公園で鹿と遊んできました', user_id: users[0].id },
    {title: 'スカイツリー', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post9.jpg"), filename:"sample_post9.jpg"),prefectures_genre: Post.prefectures_genres["tokyo"], spot_genre_id: spot_genres[1].id, post_text: '遠くの風景まで見えて綺麗でした、是非みなさんも行って欲しいです。', user_id: users[2].id }
  ]
)


