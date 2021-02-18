class Customer::OrdersController < ApplicationController
  #before_action :authenticate_customer!
  
  def new
    @order = Order.new
    #@deliver_destinations = DeliverDestination.where(customer: current_customer)
  end
    
    if params[:order][:addresses] == "residence"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.destination = current_customer.destination
    elsif params[:order][:addresses] == "registration"
      delivery = DeliverDestination.find(params[:order][:delivery_destination_id]) 
      @order.postcode = delivery.postcode
      @order.address = delivery.address
      @order.destination = delivery.destination
    elsif params[:order][:addresses] == "new_address"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.destination = params[:order][:destination]
    end
  
  
  def cretae
    order = Order.new(order_params)
    order.save
    redirect_to customer_orders_confirm_path(current_user)
  end

  def confirm
    @cart_items = current_cart
    @order = Order.new(customer: current_customer,
                       payment: params[:order][:payment])
    @order.total_price = billing(@order)
  end

  def complete
  end
  
  def index
  end
  
  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:postage, :tax_price, :payment, :postcode, :address, :destination, :order_status)
  end
  
  def address_params
    params.require(:order).permit(:postcode, :address, :destination)
  end
end
