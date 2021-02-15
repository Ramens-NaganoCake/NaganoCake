class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def cretae
    order = Order.new(order_params)
    order.save
    #redirect_to 
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[current_user.id])
  end

  def confirm
  end

  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:postage, :tax_price, :payment, :postcode, :address, :destination, :order_status, :customer_id)
  end
end
