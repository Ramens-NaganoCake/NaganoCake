FactoryBot.define do
  factory :item do
    genre_id { 1 }
    name { "MyString" }
    introduction { "MyText" }
    price { 1 }
    image_id { "MyString" }
    is_active { false }
  end
end
