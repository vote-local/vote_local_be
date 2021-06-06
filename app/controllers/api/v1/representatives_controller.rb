class Api::V1::RepresentativesController < ApplicationController
  def index
    # address = "1331 17th Street, Denver CO 80202"
    # response = RepresentativesFacade.get_representatives(address)
    representatives = RepresentativesFacade.get_representatives(params[:address])
    render json: RepresentativeSerializer.new(representatives)
  end
end
