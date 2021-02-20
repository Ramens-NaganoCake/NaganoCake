# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD
20.times do |n|
    Customer.create!(
      email: "test#{n + 1}@test.com",
      first_name: "名#{n + 1}",
      last_name: "姓#{n + 1}",
      first_name_kana: "セイ",
      last_name_kana: "メイ",
      password: "123456",
      postcode: "1234567",
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
      phone: "09012345678"
    )
end

10.times do |n|
  DeliverDestination.create!(
    destination: "test#{n + 1}",
    postcode: "123456#{n + 1}",
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    customer_id: n + 1
  )
end
=======

  Admin.create!(
    email: "admin_test@example.com",
    password: "password"
  )

  15.times do |n|
    Customer.create!(
      email: "test#{n + 1}@example.com",
      password: "password",
      first_name: "太郎#{n + 1}",
      last_name: "佐藤#{n + 1}",
      first_name_kana: "タロウ#{n + 1}",
      last_name_kana: "サトウ#{n + 1}",
      postcode: "0000000",
      address: "日本ト#{n + 1}",
      phone: "0000000000",
      is_deleted: "false"
    )
  end

  10.times do |n|
    Order.create!(
      customer_id: "#{n + 1}",
      postage: "800",
      tax_price: "10000",
      payment: "0".to_i,
      postcode: "0000000",
      address: "日本",
      destination: "配送先テスト",
      order_status: "0".to_i
    )
    Item.create!(
      genre_id: "1",
      name: "ショートケーキ#{n + 1}",
      introduction: "美味しいショートケーキ",
      price: "1500",
      image_id: "",
      is_active: "true"
    )
    ItemOrder.create!(
      item_id: "#{n + 1}",
      order_id: "#{n + 1}",
      quantity: "5",
      maiking_status: "1".to_i,
      tax_price: "10000",
    )
    CartItem.create!(
      customer_id: "1",
      item_id: "#{n + 1}",
      quantity: "5"
    )
  end
>>>>>>> origin/develop
