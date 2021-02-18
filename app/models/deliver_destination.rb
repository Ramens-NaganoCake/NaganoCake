class DeliverDestination < ApplicationRecord
  belongs_to :customer

  validates :postcode, presence: true, numericality: { only_integer: true }, length: { is: 7 }
  validates :address, presence: true
  validates :destination, presence: true
end
