class Item < ApplicationRecord
  
  validates :is_active, inclusion: { in: [true, false] }

  attachment :image
  belongs_to :genre


  has_many :item_orders, dependent: :destroy

  has_many :cart_items, dependent: :destroy


end
