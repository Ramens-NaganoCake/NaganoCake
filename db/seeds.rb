# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  Customer.create!(
    email: "test#{n + 1}@example.com",
    encrypted_password: "000000",
    password: "000000",
    first_name: "テスト#{n + 1}",
    last_name: "太朗#{n + 1}",
    first_name_kana: "テスト#{n + 1}",
    last_name_kana: "タロウ#{n + 1}",
    postcode: "0000000",
    address: "日本ト#{n + 1}",
    phone: "0000000000",
    is_deleted: "true"
    )
  end