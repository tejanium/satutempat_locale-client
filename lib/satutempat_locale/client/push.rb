module SatutempatLocale
  module Client
    class Push
      include Archive::Tar

      def initialize folder_path, server_url
        @folder_path = folder_path
        @server_url  = server_url
        @mark_file   = '.last_update'
        @client_mark = read_client_mark
      end

      def perform!
        puts 'Packing your config/locales...'
        pack_folder
        puts 'Sending data...'
        post
      rescue
        puts 'Please pull first! Warning: Your changes will be overwriten.'
      ensure
        puts 'Done.'
        clean_file
      end

      private
        def post
          RestClient.post @server_url,
                          mark: @client_mark,
                          file: file
        end

        def read_client_mark
          return -1 if File.directory?(@folder_path) && !File.exist?(@mark_file)

          File.read @mark_file
        end

        def file
          File.open(file_name, 'rb')
        end

        def clean_file
          File.delete file_name
        end

        def pack_folder
          File.open(file_name, 'wb') do |tar|
            Minitar.pack(@folder_path, tar)
          end
        end

        def file_name
          @file_name ||= "#{ Time.now.to_i }.tar"
        end
    end
  end
end
