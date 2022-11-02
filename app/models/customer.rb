class Customer < ApplicationRecord
    belongs_to :user, class_name : "User", foreign_key: "user_id"
    belongs_to :adress, class_name : "Adress", foreign_key: "adress_id"
    has_one :building, class_name: "Building", foreign_key: "customer_id"
end
