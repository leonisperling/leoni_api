class VehiclesController < ApplicationController
  def create
    @vehicle = Vehicle.find_or_initialize_by(uuid: params[:id])
    @vehicle.active = true
    if @vehicle.save
      render json: nil, status: 204
    else
      render json: @vehicle.errors, status: 403
    end
  end

  def destroy
    @vehicle = Vehicle.find_by(uuid: params[:id])
    @vehicle.update(active: false)
    render nil, status: 204
  end
end
