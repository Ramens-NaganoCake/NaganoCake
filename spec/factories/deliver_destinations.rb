FactoryBot.define do
  factory :deliver_destination do
    customer_id { 1 }
    address { "MyString" }
    postcode { "MyString" }
    destination { "MyString" }
  end
end
