FactoryBot.define do
  factory :order do
    customer_id { 1 }
    postage { 1 }
    tax_price { 1 }
    payment { 1 }
    postcode { "MyString" }
    address { "MyString" }
    destination { "MyString" }
    order_status { 1 }
  end
end
