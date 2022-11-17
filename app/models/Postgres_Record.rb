class PostgresRecord < ApplicationRecord::Base
    self.abstract_class = true
    establish_connection POSTGRES_DATABASE
end