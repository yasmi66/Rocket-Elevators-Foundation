## reference :
# https://github.com/railsadminteam/rails_admin/blob/master/lib/rails_admin/config/actions/show_in_app.rb


module RailsAdmin
  module Config
    module Actions
      class Polly < RailsAdmin::Config::Actions::Base
        # There are several options that you can set here. 
        # Check https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/base.rb for more info.
  
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          nil
        end

        register_instance_option :auditing_versions_limit do
          100
        end

        register_instance_option :controller do
          proc do

            # initialize
            polly = Aws::Polly::Client.new(
                region: 'us-west-1',
                credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
            )

            # synthesize_speech
            message = polly.synthesize_speech(output_format: 'mp3', text: "Greetings.
            There are currently #{Elevator::count} elevators deployed in #{Building::count} buildings of your #{Customer::count} customers.
            Currently, #{Elevator.where.not(elevator_status: 'Active').count} elevators are not in Running Status and are being serviced.
            You currently have #{Quote::count} quotes awaiting processing.
            You currently have #{Lead::count} leads in your contact requests.
            #{Battery::count} Batteries are deployed across #{Address.where(id: Building.select(:address_id).distinct).select(:city).distinct.count} cities",
            voice_id: 'Joanna')

            puts message

            # update speech file
            IO.copy_stream(message.audio_stream, "speechResult.mp3")
            File.rename "speechResult.mp3", "public/speech.mp3"
          end
        end

        register_instance_option :route_fragment do
          'polly.html.erb'
        end

        register_instance_option :link_icon do
          'icon-play-circle'
        end

        register_instance_option :statistics? do
          true
        end

        register_instance_option :history? do
          true
        end
      end
    end
  end
end