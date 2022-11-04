class LeadsController < ApplicationController


    require 'date'
    def create
        leads = Lead.new

        leads.contactName = params[:contactName]
        leads.contactEmail = params[:contactEmail]
        leads.contactPhone = params[:contactPhone]
        leads.contactBuisnessName = params[:contactBuisnessName]
        leads.contactDepartement = params[:contactDepartement]
        leads.projectName = params[:contactProject]
        leads.message = params[:contactMessage]
        leads.contactAttachment = params[:contactAttachment]

        current_time = DateTime.now

        leads.contactDate = current_time.strftime "%d/%m/%Y"

        leads.save
        flash[:success] = "Request successfully sent!"

    end
