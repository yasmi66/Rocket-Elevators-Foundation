POSTGRES_DATABASE = YAML::load(
    ERB.new(
        File.read("#{ Rails.root }/config/database.postgres.yml")
    ).result )[Rails.env.to_s]