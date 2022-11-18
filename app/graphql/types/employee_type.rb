# frozen_string_literal: true

module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: false
    field :lastName, String
    field :firstName, String
    field :title, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    
  end
end
