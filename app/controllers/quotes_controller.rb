class QuotesController < ApplicationController
  def request_quote
  end

  def create
    quote = Quote.new
    quote.nbrAppBuild = params[:nbrAppBuild]
    if params[:nbrFloors] == params[:nbrFloorsR]
      quote.nbrFloors = params[:nbrFloorsR]
    end
    quote.nbrBasementFloors = params[:nbrBasementsFloors]
    quote.nbrDisBui = params[:nbrDisBui]
    quote.nbrParking = params[:nbrParking]
    quote.nbrElevatorCages = params[:nbrElevatorCages]
    quote.nbrOccPerFloor = params[:nbrOccPerFloor]
    quote.nbrActPerDay = params[:nbrActPerDay]
    quote.type_of_building = params[:type_of_building]
    quote.type_of_service = params[:type_of_service]

    quote.save

  end
end
