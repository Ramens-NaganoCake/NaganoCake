class Item < ApplicationRecord
<<<<<<< HEAD
    has_many :cart_items
    belongs_to :genre
=======


  validates :is_active, inclusion: { in: [true, false] }

  attachment :image
  belongs_to :genre


  has_many :item_orders, dependent: :destroy

  has_many :cart_items, dependent: :destroy


>>>>>>> origin/develop
end
