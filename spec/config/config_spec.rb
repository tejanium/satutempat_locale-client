require 'spec_helper'

describe SatutempatLocale::Client::Config do
  before :each do
    SatutempatLocale::Client.reset_configuration
  end

  context 'override' do
    before :each do
      SatutempatLocale::Client.configure do |config|
        config.server_url  = 'http://anywhere.else'
      end
    end

    it 'locale_path goes to http://anywhere.else' do
      SatutempatLocale::Client.configuration.server_url.should eql 'http://anywhere.else'
    end
  end
end
