module SatutempatLocale
  module Client
    class Tool
      NO_ARGUMENT_MESSAGE = 'Please specify server_url as second argument or SatutempatLocale::Client.configure'

      def initialize(argv)
        @args       = argv
        @server_url = SatutempatLocale::Client.configuration.server_url || @args[1]
      end

      def run
        (puts "Satutempat Locale Client v#{ VERSION }"; return) if @args.first.nil?
        (puts NO_ARGUMENT_MESSAGE; return) if @server_url.nil?

        run!
      end

      def run!
        case @args.first
          when /push/
            Push.new('config/locales', @server_url).perform!
          when /pull/
            Pull.new(@server_url).perform!
        end
      end
    end
  end
end
