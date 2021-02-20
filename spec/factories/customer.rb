FactoryBot.define do
  factory :customer do
    first_name { Faker::Lorem.characters(number: 2) }
    last_name { Faker::Lorem.characters(number: 2) }
    first_name_kana { Faker::Lorem.characters(number: 2) }
    last_name_kana { Faker::Lorem.characters(number: 2) }
    postcode { '1234567' }
    address { Faker::Lorem.characters(number: 20) }
    phone { '09012345678' }
    email { Faker::Internet.email }
    is_deleted { false }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
