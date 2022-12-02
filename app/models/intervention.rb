class Intervention < ApplicationRecord
    belongs_to :users, optional: true
    belongs_to :customers, optional: true
    belongs_to :columns, optional: true
    belongs_to :buildings, optional: true
    belongs_to :batteries, optional: true
    belongs_to :elevators, optional: true
    belongs_to :employees, optional: true
end