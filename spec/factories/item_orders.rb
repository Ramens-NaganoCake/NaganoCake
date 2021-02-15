FactoryBot.define do
  factory :item_order do
    item_id { 1 }
    order_id { 1 }
    quantity { 1 }
    maiking_status { 1 }
    tax_price { 1 }
  end
end
