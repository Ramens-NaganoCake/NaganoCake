class DeliverDestination < ApplicationRecord
<<<<<<< HEAD
    belongs_to :customer
    
	# order/newで使用
	def order_address
	  self.postcode + self.address + self.destination
	end
=======
  belongs_to :customer

  validates :postcode, presence: true, numericality: { only_integer: true }, length: { is: 7 }
  validates :address, presence: true
  validates :destination, presence: true
>>>>>>> origin/develop
end
