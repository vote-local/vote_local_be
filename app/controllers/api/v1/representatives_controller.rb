class Api::V1::RepresentativesController < ApplicationController
  def index
    if params[:address] == nil 
      render json: { status: 404, message: 'No address parameter entered: please type address= at the end of your query' }, status: :not_found
    elsif params[:address].empty?
      render json: { status: 404, message: 'Address not found' }, status: :not_found
    else
      representatives = RepresentativesFacade.get_representatives(params[:address])
      render json: RepresentativeSerializer.new(representatives)
    end
  end
end

