require 'spec_helper'
require 'webmock/rspec'

describe SatutempatLocale::Client::Push do
  include WebMock::API

  before :each do
    Time.stub now: Time.at(100)
  end

  let :server_url do
    'http://anywhere.else/somewhere'
  end

  describe '#perform!' do
    it 'pack folder before push' do
      SatutempatLocale::Client::Push.any_instance.stub post: true,
                                                       clean_file: true

      lambda{
        SatutempatLocale::Client::Push.new('spec/fixtures', server_url).perform!
      }.should change { File.exist? '100.tar' }.from(false).to(true)

      File.delete '100.tar'
    end

    it 'trying to post file' do
      push = SatutempatLocale::Client::Push.new('spec/fixtures', server_url)

      push.should_receive :file
      stub_request(:post, server_url)

      push.perform!
    end

    it 'post with correct parameter' do
      push = SatutempatLocale::Client::Push.new('spec/fixtures', server_url)

      push.stub file: true
      stub_request(:post, server_url).with body: { mark: '-1', file: 'true' }

      push.perform!
    end
  end
end
