class Item < ApplicationRecord


  has_many :item_orders, dependent: :destroy

  has_many :cart_items, dependent: :destroy

end
