class Employee < ApplicationRecord
    has_one :battery, class_name: "Battery", foreign_key: "employee_id"
end
