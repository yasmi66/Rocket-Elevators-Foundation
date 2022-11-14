require 'twilio-ruby'
class Elevator < ApplicationRecord
    # belongs_to :column, class_name: "Column", foreign_key: "column_id"
    belongs_to :column
    before_save :intervention

    def intervention
        if self.elevator_status_changed?
            client = Slack::Web::Client.new
            texte = "The Elevator #{self.id} with Serial Number #{self.serial_nb} changed status from #{self.elevator_status_was} to #{self.elevator_status}"
            client.chat_postMessage(channel: '#eileen-elevator_operations', text: texte, as_user: true)
        end
    end

            # put your own credentials here
            account_sid = ENV['TWILIO_ACCOUNT_SID']
            auth_token = ENV['TWILIO_AUTH_TOKEN']
            twilio_phone = ENV['TWILIO_PHONE_NUMBER']

            # set up a client to talk to the Twilio REST API
            @client = Twilio::REST::Client.new(account_sid, auth_token)
            messages = @client.messages.create(
                    from: twilio_phone,
                    to: '+15147131412',
                    body: "Elevator #{self.id} with Serial Number #{self.serial_nb} requires maintenance."
                )

        end
    end

end