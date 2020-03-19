class LocationsController < ApplicationController
  OFFICE_COORDINATES = [52.53, 13.403]
  RADIUS = 3.5

  before_action :set_vehicle

  def create
    return unless within_radius?
    return unless @vehicle.active

    @location = Location.new(
      lat: params[:lat],
      lng: params[:lng],
      at: params[:at]
    )
    @location.vehicle = @vehicle
    if @location.save
      render json: nil, status: 204
    else
      render json: @location.errors, status: 403
    end
  end

  private

  def within_radius?
    distance = Geocoder::Calculations.distance_between(
      OFFICE_COORDINATES, coordinates
    )

    distance < RADIUS
  end

  def coordinates
    [params[:lat], params[:lng]]
  end

  def set_vehicle
    @vehicle = Vehicle.find_by(uuid: params[:vehicle_id])
  end
end
