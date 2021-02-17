class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    item_orders = @order.item_orders
    @order.update(order_params)
    if @order.order_status === "入金確認"
      item_orders.each do |item_order|
        item_order.update(item_order_params)
      end
    end
    @orders = Order.all
    render action: :index
  end

  private

    def item_order_params
      params.permit(:maiking_status).merge(maiking_status: 1)
    end

    def order_params
      params.require(:order).permit(:order_status).merge(order_status: params[:order][:order_status].to_i)
    end
end
