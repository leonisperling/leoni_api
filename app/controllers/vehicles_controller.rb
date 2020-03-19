class VehiclesController < ApplicationController
  def create
    @vehicle = Vehicle.new
    if @vehicle.save
      render json: @vehicle, status: 204
    else
      render json: @vehicle.errors, status: 403
    end
  end

  def destroy
    @vehicle = Vehicle.find_by(uuid: params[:id])
    @vehicle.destroy
  end
end
