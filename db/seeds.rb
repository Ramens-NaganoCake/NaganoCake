# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
      maiking_status: "0".to_i,
      tax_price: "10000",
    )
    CartItem.create!(
      customer_id: "1",
      item_id: "#{n + 1}",
      quantity: "5"
    )
  end
  
  5.times do |n|
    Genre.create!(
       name: "ジャンル#{n + 1}"
      )
    end

