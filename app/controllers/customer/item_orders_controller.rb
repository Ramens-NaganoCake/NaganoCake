class Customer::ItemOrdersController < ApplicationController
    
    def create
    item = Item.find(params[:item_id])
    order = current_customer.orders.new(item_order_params)
    order.item_id = item.id
    order.save
    redirect_to complete_customer_orders_path
    end
    
    private
    def item_order_params
        params.require(:item_order).permit(:quantity, :tax_price)
    end
end
