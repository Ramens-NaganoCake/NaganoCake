# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin_test@example.com",
  encrypted_password: "000000",
  password: "000000"
  )

15.times do |n|
  Customer.create!(
    email: "test#{n + 1}@example.com",
    encrypted_password: "000000",
    password: "000000",
    first_name: "太朗#{n + 1}",
    last_name: "テスト#{n + 1}",
    first_name_kana: "タロウ#{n + 1}",
    last_name_kana: "テスト#{n + 1}",
    postcode: "0000000",
    address: "日本#{n + 1}",
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
    image_id: "sample.jpg",
    is_active: "true"
    )
    
  ItemOrder.create!(
    item_id: "#{n + 1}",
    order_id: "#{n + 1}",
    quantity: "5",
    maiking_status: "0".to_i,
    tax_price: "10000",
    )
  end

Item.create!(
  genre_id: "1",
  name: "チョコレートケーキ",
  introduction: "美味しいチョコレートケーキ",
  price: "2500",
  image_id: "sample.jpg",
  is_active: "true"
  )
  
ItemOrder.create!(
  item_id: "11",
  order_id: "1",
  quantity: "2",
  maiking_status: "0".to_i,
  tax_price: "2500",
  )
  

Item.create!(
  genre_id: "1",
  name: "シュークリーム",
  introduction: "美味しいシュークリーム",
  price: "1500",
  image_id: "sample.jpg",
  is_active: "true"
  )
  
Order.create!(
  customer_id: "1",
  postage: "800",
  tax_price: "2500",
  payment: "0".to_i,
  postcode: "0000000",
  address: "日本",
  destination: "配送先テスト2",
  order_status: "0".to_i
  )
  
ItemOrder.create!(
  item_id: "11",
  order_id: "11",
  quantity: "3",
  maiking_status: "0".to_i,
  tax_price: "10000",
  )


