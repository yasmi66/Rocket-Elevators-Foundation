# frozen_string_literal: true

module Types
  class FactInterventionType < Types::BaseObject
    field :address, [Types::AddressType], null: false

    field :id, ID, null: false
    field :employee_id, Integer
    field :building_id, Integer
    field :battery_id, Integer
    field :column_id, Integer
    field :elevator_id, Integer
    field :start_intervention, GraphQL::Types::ISO8601DateTime, null: false
    field :end_intervention, GraphQL::Types::ISO8601DateTime, null: true
    field :result, String
    field :report, String
    field :status, String

    def address
      Address.where(id: object.building_id)
    end
  end

end
