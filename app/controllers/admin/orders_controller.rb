class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @orders = Order.all
    render action: :index
  end

  private
    def order_params
      params.require(:order).permit(:order_status).merge(order_status: params[:order][:order_status].to_i)
    end
end
