module SatutempatLocale
  module Client
    FILE_NAME = 'locale.tar'

    class Pull
      include Archive::Tar

      def initialize server_url
        @server_url    = server_url
        @unpack_folder = Time.now.to_i.to_s
      end

      def perform!
        get
        unpack
      ensure
        clean_file
      end

      private
        def get
          File.open(FILE_NAME, 'w') do |f|
            f.write RestClient.get @server_url
          end
        end

        def unpack
          Minitar.unpack FILE_NAME,
                         SatutempatLocale::Client.configuration.locale_path
        end

        def clean_file
          File.delete FILE_NAME
        end
    end
  end
end
