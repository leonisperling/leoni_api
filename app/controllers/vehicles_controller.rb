class VehiclesController < ApplicationController
  def create
    @vehicle = Vehicle.new(uuid: params[:id])
    if @vehicle.save
      render json: nil, status: 204
    else
      render json: @vehicle.errors, status: 403
    end
  end

  def destroy
    @vehicle = Vehicle.find_by(uuid: params[:id])
    @vehicle.destroy
    render nil, status: 204
  end
end
