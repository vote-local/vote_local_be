class Api::V1::RepresentativesController < ApplicationController
  def index
    # address = "1331 17th Street, Denver CO 80202"
    response = RepresentativesFacade.get_representatives(params[:address])
    require "pry"; binding.pry
    render json: RepresentativeSerializer.new(response)
  end
end
