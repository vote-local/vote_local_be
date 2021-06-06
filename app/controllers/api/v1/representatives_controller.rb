class Api::V1::RepresentativesController < ApplicationController
  def index
    representatives = RepresentativesFacade.get_representatives(params[:address])
    render json: RepresentativeSerializer.new(representatives)
  end
end
