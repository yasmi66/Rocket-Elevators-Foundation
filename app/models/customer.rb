class Customer < ApplicationRecord
    has_one :user
    belongs_to :adress
    has_one :building
end
