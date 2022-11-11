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
        leads.projectDescription = params[:projectDescription]
        leads.message = params[:contactMessage]
        leads.contactAttachment = params[:contactAttachment]

        current_time = DateTime.now

        leads.contactDate = current_time.strftime "%d/%m/%Y"

        leads.save
        flash[:success] = "Request successfully sent!"

    end
    
    # def download
    #     if contactAttachment.exists?
    #         client = DropboxApi::Client.new(ENV['DROPBOX_API_TOKEN'])
    #         result = client.create_folder('/' + contactName)
            
    #         test = Lead.first
    #         binary = test.contactAttachment
    #         client.upload('/' + contactName, binary)
    #     end
    # end

    # def delete
    #     if contactAttachment.attached?
    #         test = Lead.first
    #         binary = test.contactAttachment
    #         client = DropboxApi::Client.new(ENV['DROPBOX_API_TOKEN'])
    #         client.delete('/' + contactName, binary)
    #     end
    # end

end
