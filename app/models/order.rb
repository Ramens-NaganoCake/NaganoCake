class Order < ApplicationRecord
  belongs_to :customer
  has_many :item_orders, dependent: :destroy

  def full_address
    self.postcode + self.address
  end

  #注文の全ての数量合計
  def sum_order_items
    self.item_orders.all.sum(:quantity)
  end

  #注文の合計金額
  def total_price
    array = []
    self.item_orders.each do |item_order|
       array << item_order.tax_price * item_order.quantity
    end
    array.sum
  end

  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum payment: { クレジットカード: 0, 銀行振込: 1 }
end
