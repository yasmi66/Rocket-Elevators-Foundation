module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end
    field :address,
    [Types::AddressType],
    null: false,
    description: "Return a list of addresses"

    def address
      Address.all
    end
  
    # field :fact_intervention, [FactInterventionType], null: false,
    # description: "For the fact intervention queries"
    # def fact_intervention
    #   FactIntervention.all
    # end

    field :interventions, [Types::FactInterventionType], null: false do
      description 'Find all interventions'
    end

    field :intervention, Types::FactInterventionType, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    def interventions
      FactIntervention.all
    end

    def intervention(id:)
      FactIntervention.find(id)
    end

  end
end
