class LocationsController < ApplicationController
  def create
    @vehicle = Vehicle.find_by(uuid: params[:vehicle_id])
    @location = Location.new(location_params)
    @location.vehicle = @vehicle
    if @location.save
      render json: @location, status: 204
    else
      render json: @location.errors, status: 403
    end
  end

  private

  def location_params
    params.permit(:lat, :lng)
  end
end
