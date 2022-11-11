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

        if leads.contactAttachment.present?
            client = DropboxApi::Client.new(ENV['DROPBOX_API_TOKEN'])
            begin
                result = client.create_folder('/' + leads.contactName)
                # test = Lead.first
                # binary = test.leads.contactAttachment
                file_content = IO.read("#{leads.contactAttachment}")
                client.upload('/' + leads.contactName + '/' + file_content, leads.contactAttachment)
            end
        end
    end

    # def delete
    #     if contactAttachment.attached?
    #         test = Lead.first
    #         binary = test.contactAttachment
    #         client = DropboxApi::Client.new(ENV['DROPBOX_API_TOKEN'])
    #         client.delete('/' + contactName, binary)
    #     end
    # end

end
