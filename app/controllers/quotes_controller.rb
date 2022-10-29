class QuotesController < ApplicationController
  def request_quote
  end

  def create
    quote = Quote.new
    quote.nbrAppBuild = params[:nbrAppBuild]

    quote.nbrFloorsR = params[:nbrFloorsR]
    quote.nbrFloorsC = params[:nbrFloorsC]
    quote.nbrFloorsCor = params[:nbrFloorsCor]
    quote.nbrFloorsH = params[:nbrFloorsH]

    quote.nbrBasementFloorsR = params[:nbrBasementsFloorsR]
    quote.nbrBasementFloorsC = params[:nbrBasementsFloorsC]
    quote.nbrBasementFloorsCor = params[:nbrBasementsFloorsCor]
    quote.nbrBasementFloorsH = params[:nbrBasementsFloorsH]

    quote.nbrDisBuiCor = params[:nbrDisBuiCor]
    quote.nbrDisBuiH = params[:nbrDisBuiH]

    quote.nbrParkingC = params[:nbrParkingC]

    quote.nbrParkingCor = params[:nbrParkingCor]
    quote.nbrParkingH = params[:nbrParkingsH]


    quote.nbrElevatorCages = params[:nbrElevatorCages]
    quote.nbrOccPerFloorCor = params[:nbrOccPerFloorCor]
    quote.nbrOccPerFloorH = params[:nbrOccPerFloorH]
    quote.nbrActPerDay = params[:nbrActPerDay]
    quote.buildingType = params[:type_of_building]
    quote.serviceType = params[:type_of_service]

    quote.save

    flash[:success] = "New to-do item successfully added!"

  end
end
