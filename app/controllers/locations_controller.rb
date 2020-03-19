class LocationsController < ApplicationController
  def create
    @vehicle = Vehicle.find_by(uuid: params[:vehicle_id])
    @location = Location.new(
      lat: params[:lat],
      lng: params[:lng],
      at: params[:at],
    )
    @location.vehicle = @vehicle
    if @location.save
      render json: nil, status: 204
    else
      p @location.errors
      render json: @location.errors, status: 403
    end
  end

  private

  def within_radius?
    office_coordinates = [52.53, 13.403]
    radius = 3_500
  end

  def coordinates
    [params[:lat], params[:lng]]
  end



end
