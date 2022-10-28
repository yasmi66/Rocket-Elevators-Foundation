class QuotesController < ApplicationController
  def request_quote
  end

  def create
    quote = Quote.new
    quote.nbrAppBuild = params[:nbrAppBuild]

    if (params[:nbrFloorsR] != nil)
      quote.nbrFloors = params[:nbrFloorsR]
    elsif (params[:nbrFloorsC] != nil)
      quote.nbrFloors = params[:nbrFloorsC]
    elsif (params[:nbrFloorsCor] != nil)
      quote.nbrFloors = params[:nbrFloorsCor]
    elsif (params[:nbrFloorsH] != nil)
      quote.nbrFloors = params[:nbrFloorsH]
    end

    if (params[:nbrBasementsFloorsR] != nil)
      quote.nbrBasementFloors = params[:nbrBasementsFloorsR]
    elsif (params[:nbrBasementsFloorsC] != nil)
      quote.nbrBasementFloors = params[:nbrBasementsFloorsC]
    elsif (params[:nbrBasementsFloorsCor] != nil)
      quote.nbrBasementFloors = params[:nbrBasementsFloorsCor]
    elsif (params[:nbrBasementsFloorsH] != nil)
      quote.nbrBasementFloors = params[:nbrBasementsFloorsH]
    end

    quote.nbrDisBui = params[:nbrDisBui]
    quote.nbrParking = params[:nbrParking]
    quote.nbrElevatorCages = params[:nbrElevatorCages]
    quote.nbrOccPerFloor = params[:nbrOccPerFloor]
    quote.nbrActPerDay = params[:nbrActPerDay]
    quote.type_of_building = params[:type_of_building]
    quote.type_of_service = params[:type_of_service]

    quote.save

    flash[:success] = "New to-do item successfully added!"

  end
end
