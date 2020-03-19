class LocationsController < ApplicationController
  def create
    return unless within_radius?

    @vehicle = Vehicle.find_by(uuid: params[:vehicle_id])
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
    office_coordinates = [[52.53, 13.403], [51.50, 12.4]]
    radius = 3.5
    distance = Geocoder::Calculations.distance_between(office_coordinates, coordinates)

    distance < radius
  end

  def coordinates
    [params[:lat], params[:lng]]
  end
end
