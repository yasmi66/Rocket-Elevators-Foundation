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

end
