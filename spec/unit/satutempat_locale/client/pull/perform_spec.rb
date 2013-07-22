require 'spec_helper'
require 'webmock/rspec'

describe SatutempatLocale::Client::Pull do
  include WebMock::API

  let :server_url do
    'http://anywhere.else/somewhere'
  end

  let :tar_file do
    File.new('spec/tar/fixtures.tar')
  end

  describe '#perform!' do
    it 'receive pull' do
      stub_request(:get, server_url).to_return body: tar_file

      lambda{
        SatutempatLocale::Client::Pull.new(server_url).perform!
      }.should change { File.directory? 'fixtures' }.from(false).to(true)

      FileUtils.rm_rf 'fixtures'
    end
  end
end
