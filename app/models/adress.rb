class Adress < ApplicationRecord
    has_one :customer, class_name: "Customer", foreign_key: "adress_id"
    has_one :building, class_name: "Building", foreign_key: "adress_id"
end
