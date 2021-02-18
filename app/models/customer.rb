class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deliver_destinations, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :postcode, presence: true, numericality: { only_integer: true }, length: { is: 7 }
  validates :address, presence: true
  validates :phone, presence: true, numericality: { only_integer: true }
end
