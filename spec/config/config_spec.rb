require 'spec_helper'

describe SatutempatLocale::Client::Config do
  before :each do
    SatutempatLocale::Client.reset_configuration
  end

  context 'override' do
    before :each do
      SatutempatLocale::Client.configure do |config|
        config.locale_path = 'somewhere/else'
        config.server_url  = 'http://anywhere.else'
      end
    end

    it 'locale_path goes to somewhere/else' do
      SatutempatLocale::Client.configuration.locale_path.should eql 'somewhere/else'
    end

    it 'locale_path goes to http://anywhere.else' do
      SatutempatLocale::Client.configuration.server_url.should eql 'http://anywhere.else'
    end
  end

  context 'default' do
    it 'locale_path goes to config/locales' do
      SatutempatLocale::Client.configuration.locale_path.should eql 'config/locales'
    end

    it 'server_url goes to nil' do
      SatutempatLocale::Client.configuration.server_url.should be_nil
    end
  end
end
