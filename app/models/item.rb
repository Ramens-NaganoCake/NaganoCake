class Item < ApplicationRecord

  validates :is_active, inclusion: { in: [true, false] }

  attachment :image
  belongs_to :genre

end
