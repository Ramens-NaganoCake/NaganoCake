class Item < ApplicationRecord

  has_many :item_orders, dependent: :destroy
end
