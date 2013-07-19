module SatutempatLocale
  module Client
    class Config
      attr_accessor :locale_path, :server_url

      def initialize
        @locale_path = 'config/locales'
      end
    end
  end
end
