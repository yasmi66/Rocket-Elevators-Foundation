require 'pg'

class PostgresRecord < ApplicationRecord::Base
    self.table_name = "fact_intervention"
    self.abstract_class = true
    establish_connection POSTGRES_DATABASE
end