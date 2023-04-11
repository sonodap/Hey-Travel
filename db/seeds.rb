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

# User.create!(
#   name: '山田',
#   gender: '男',
#   image: File.open("./app/assets/images/default.icon.jpeg"),
#   email: 'user@com',
#   password: 'travel',
# )

user = User.create!(
  name: '山田',
  gender: '男',
  email: 'user@com',
  password: 'travel'
)

user.image.attach(io: File.open(Rails.root.join('app/assets/images/default.icon.jpeg')),filename: 'default.icon.jpeg')