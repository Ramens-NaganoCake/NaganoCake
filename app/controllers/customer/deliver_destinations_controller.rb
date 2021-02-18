class Customer::DeliverDestinationsController < ApplicationController
  before_action :authenticate_customer!
  before_action :baria_user, only: [:destroy, :edit, :update]

  def index
    @deliver_destination = DeliverDestination.new
    @deliver_destinations = current_customer.deliver_destinations
  end

  def create
    @deliver_destination = DeliverDestination.new(deliver_destination_params)
    @deliver_destination.customer_id = current_customer.id
    @deliver_destinations = current_customer.deliver_destinations
    if @deliver_destination.save
      redirect_to customer_deliver_destinations_path
    else
      render :index
    end
  end

  def destroy
    @deliver_destination = DeliverDestination.find(params[:id])
    @deliver_destination.destroy
    redirect_to customer_deliver_destinations_path
  end

  def edit
    @deliver_destination = DeliverDestination.find(params[:id])
  end

  def update
    @deliver_destination = DeliverDestination.find(params[:id])
    if @deliver_destination.update(deliver_destination_params)
      redirect_to customer_deliver_destinations_path
    else
      render :edit
    end
  end

  private

  def deliver_destination_params
    params.require(:deliver_destination).permit(:postcode, :address, :destination)
  end

  def baria_user
    unless DeliverDestination.find(params[:id]).customer.id.to_i == current_customer.id
      redirect_to customer_customer_path
    end
  end

end
