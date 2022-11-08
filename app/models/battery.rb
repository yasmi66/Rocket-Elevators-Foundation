
class Battery < ApplicationRecord
  # belongs_to :building, class_name: "Building", foreign_key: "building_id"
  # belongs_to :employee
  # has_many :column, class_name: "Column", foreign_key: "battery_id"
  belongs_to :building
  has_many :columns
end

