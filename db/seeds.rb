# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

9.times do |n|
  Item.create!(
    genre_id: "1",
    name: "チョコケーキ#{n+1}",
    introduction: "チョコ",
    price: "3000",
    image: open("./app/assets/images/no_image.jpg"),
    is_active: "true"
  )
end