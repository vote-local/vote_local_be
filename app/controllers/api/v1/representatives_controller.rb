class Api::V1::RepresentativesController < ApplicationController
  def index
    address = "99 E. Arizona St, Denver CO 80210"
    response = RepresentativeService.get_representatives_by_address(address)
    render json: RepresentativeSerializer.new(response)
  end
end
