
desc "Managing the pg database"
task spec: ["pg:db:test:prepare"]

namespace :pg do
    desc "Manage database"

  namespace :db do |ns|
    desc "Pg"

    task :drop do
      Rake::Task["db:drop"].invoke
    end

    task :create do
      Rake::Task["db:create"].invoke
    end

    task :setup do
      Rake::Task["db:setup"].invoke
    end

    task :migrate do
      Rake::Task["db:migrate"].invoke
    end

    task :fact_quote => :environment do
      fq = ActiveRecord::Base.connection.execute('SELECT q.id, q.created_at
                                                  FROM quotes q;')
      ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host => "localhost",
        :username => "postgres",
        :password => "password",
        :database => "data_warehouse")
      fq.each do |val|
        query = "INSERT INTO public.fact_quotes(quote_id, creation_date, company_name, email, nb_elevator)
                                                  VALUES(#{val[0]},'#{val[1]}', '#{Faker::Company.unique.name.gsub("'","''")}', '#{Faker::Internet.email}', #{Faker::Number.number(digits: 2)});"
        ActiveRecord::Base.connection.execute(query)
      end
    end


    task :fact_contact => :environment do
      fc = ActiveRecord::Base.connection.execute('SELECT l.id, l.created_at, l.contactName, l.contactEmail, l.projectName
                                                  FROM leads l;')
      ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host => "localhost",
        :username => "postgres",
        :password => "password",
        :database => "data_warehouse")
      fc.each do |val|
        query = "INSERT INTO public.fact_contacts(contact_id, creation_date, compagny_name, email, name_project)
                                                  VALUES(#{val[0]}, '#{val[1]}', '\#{val[2]}', '#{val[3]}', '#{val[4]}');"
        ActiveRecord::Base.connection.execute(query)
      end
    end


    task :fact_elevator => :environment do
      fe = ActiveRecord::Base.connection.execute('SELECT el.serial_nb, el.date_commissioning
                                                  FROM elevators el;')
      ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host => "localhost",
        :username => "postgres",
        :password => "password",
        :database => "data_warehouse")
      fe.each do |val|
        query = "INSERT INTO public.fact_elevators(serial_number, date_commissioning, building_id, customer_id, city)
                                                  VALUES(#{val[0]}, '#{val[1]}', #{Faker::Number.number(digits: 2)}, #{Faker::Number.number(digits: 2)}, '#{Faker::Address.city}');"
        ActiveRecord::Base.connection.execute(query)
      end
    end


    task :dim_customers => :environment do
      dc = ActiveRecord::Base.connection.execute('SELECT c.created_at, c.CompanyName, c.FullNameCompanyContact, c.EmailCompanyContact
                                                  FROM customers c;')
      ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host => "localhost",
        :username => "postgres",
        :password => "password",
        :database => "data_warehouse")
      dc.each do |val|
        query = "INSERT INTO public.dim_customers(creation_date, compagny_name, full_name_contact, email, nb_elevator, city)
                                                  VALUES('#{val[0]}', '\#{val[1]}', '\#{val[2]}', '#{val[3]}', #{Faker::Number.number(digits: 2)}, '\#{Faker::Address.city}');"
        ActiveRecord::Base.connection.execute(query)
      end
    end


    task :fact_interventions => :environment do
      fi = ActiveRecord::Base.connection.execute('SELECT e.id, c.id, b.id, b.building_id, b.employee_id, e.created_at, e.updated_at
                                                  FROM elevators e
                                                  JOIN columns c ON e.column_id = c.id
                                                  JOIN batteries b ON c.battery_id = b.id;')
      ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host => "localhost",
        :username => "postgres",
        :password => "password",
        :database => "data_warehouse")
      fi.each do |val|
        query = "INSERT INTO public.fact_interventions(employee_id, building_id, battery_id, column_id, elevator_id, start_intervention, end_intervention, result, report, status)
                                                  VALUES('#{val[4]}', '#{val[3]}', '#{val[2]}', '#{val[1]}', '#{val[0]}', '#{val[5]}', '#{val[6]}', '#{["Success", "Failure", "Incomplete"].sample}', '#{Faker::Lorem.sentence}', '#{["Pending", "InProgress", "Interrupted", "Resumed", "Complete"].sample}');"
        ActiveRecord::Base.connection.execute(query)
      end
    end


    task :rollback do
      Rake::Task["db:rollback"].invoke
    end

    task :seed do
      Rake::Task["db:seed"].invoke
    end

    task :version do
      Rake::Task["db:version"].invoke
    end

    # task :FactElevator :environment do
    #   x = FactElevator.count
    #   puts x
    # end

    namespace :schema do
      task :load do
        Rake::Task["db:schema:load"].invoke
      end

      task :dump do
        Rake::Task["db:schema:dump"].invoke
      end
    end

    namespace :test do
      task :prepare do
        Rake::Task["db:test:prepare"].invoke
      end
    end

    # append and prepend proper tasks to all the tasks defined here above
    ns.tasks.each do |task|
      task.enhance ["pg:set_custom_config"] do
        Rake::Task["pg:revert_to_original_config"].invoke
      end
    end
  end

  task :set_custom_config do
    @original_config = {
      env_schema: "db/schema.rb",
      config: Rails.application.config.dup
    }

    # set config variables for custom database
    ENV['SCHEMA'] = "db_pg/schema.rb"
    Rails.application.config.paths['db'] = ["db_pg"]
    Rails.application.config.paths['db/migrate'] = ["db_pg/migrate"]
    Rails.application.config.paths['db/seeds.rb'] = ["db_pg/seeds.rb"]
    Rails.application.config.paths['config/database'] = ["config/database.postgres.yml"]
  end

  task :revert_to_original_config do
    # reset config variables to original values
    ENV['SCHEMA'] = @original_config[:env_schema]
    Rails.application.config = @original_config[:config]
  end



end
