FactoryBot.define do
  factory :deliver_destination do
    customer_id { 1 }
    address { Faker::Lorem.characters(number: 20) }
    postcode { "1234567" }
    destination { Faker::Lorem.characters(number: 4) }
  end
end
