class CartItem < ApplicationRecord
<<<<<<< HEAD
    belongs_to :customer
    belongs_to :item
    
=======


  belongs_to :customer
  belongs_to :item
  
  validates :quantity, numericality: { only_integer: true }

>>>>>>> 594436e7d51fa7119e1152232d7949138381f490

end
