class Admin::ItemOrdersController < ApplicationController
  def update
    item_order = ItemOrder.find(params[:id])
    item_order.update(item_order_params)
    redirect_to admin_order_path(item_order.order_id)
  end
  
  private
    def item_order_params
      params.require(:item_order).permit(:maiking_status).merge(maiking_status: params[:item_order][:maiking_status].to_i)
    end
end
