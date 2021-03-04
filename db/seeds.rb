# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#


15.times do |n|
  Customer.create!(
    email: "test#{n + 1}@example2.com",
    password: "000000",
    first_name: "テスト#{n + 1}",
    last_name: "太朗#{n + 1}",
    first_name_kana: "テスト#{n + 1}",
    last_name_kana: "タロウ#{n + 1}",
    postcode: "0000000",
    address: "日本ト#{n + 1}",
    phone: "0000000000",
    is_deleted: false
    )
  end

Admin.create!(
  email: "admin_test@example.com",
  password: "000000"
  )

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


  10.times do |n|
    Item.create!(
      genre_id: "1",
      name: "ショートケーキ#{n + 1}",
      introduction: "美味しいショートケーキ",
      price: "1500",
      image_id: "",
      is_active: "true"
    )
  end
  
  5.times do |n|
    Genre.create!(
       name: "ジャンル#{n + 1}"
      )
    end

