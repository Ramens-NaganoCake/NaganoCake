class DeliverDestinationsController < ApplicationController
  def index
  end

  def edit
  end
  
  private
  def deliver_destination_params
    params.require(:deliver_destination).permit(:postcode, :address, :destination)
  end
end
