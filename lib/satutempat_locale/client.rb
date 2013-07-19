require 'zlib'
require 'archive/tar/minitar'
require 'rest_client'
require 'satutempat_locale/client/version'
require 'satutempat_locale/client/config'
require 'satutempat_locale/client/push'
require 'satutempat_locale/client/pull'

module SatutempatLocale
  module Client
    class << self
      attr_accessor :configuration
    end

    def self.configuration
      @configuration ||= Config.new
    end

    def self.configure
      yield configuration
    end

    def self.reset_configuration
      @configuration = Config.new
    end
  end
end
