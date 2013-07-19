module SatutempatLocale
  module Client
    class Tool
      def initialize(argv)
        @args = argv
      end

      def run
        case @args.first
          when /push/
            Push.new(
              SatutempatLocale::Client.configuration.locale_path,
              SatutempatLocale::Client.configuration.server_url
            ).perform!
          when /pull/
            Pull.new(SatutempatLocale::Client.configuration.server_url).perform!
          else
            puts "Satutempat Locale Client v#{ VERSION }"
        end
      end
    end
  end
end
