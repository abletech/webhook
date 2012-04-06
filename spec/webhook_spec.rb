require 'spec_helper'
require 'webhook'

describe Webhook do
  describe :post do
    context 'with good params' do
      use_vcr_cassette 'requestbin/simple_request'

      it 'returns a simple 200 response' do
        code, message, body = Webhook.post('http://requestb.in/yadzsfya', :name => 'Abletech')
        code.should eq('200')
        message.should eq("OK")
        body.should match(/ok/)
      end
    end

    context 'with no params' do
      use_vcr_cassette 'requestbin/no_params'

      it 'returns a simple 200 response' do
        code, message, body = Webhook.post('http://requestb.in/yadzsfya')
        code.should eq('200')
        message.should eq("OK")
        body.should match(/ok/)
      end
    end

    context 'with two request headers' do
      use_vcr_cassette 'requestbin/extra_headers'

      it 'returns a simple 200 response' do
        code, message, body = Webhook.post(
          'http://requestb.in/yadzsfya', 
          {
            'time' => 'to go'
          }, 
          {
            'Referer' => 'http://www.abletech.co.nz',
            'Initiator' => 'http://www.addressfinder.co.nz'
          }
        )

        code.should eq('200')
        message.should eq("OK")
        body.should match(/ok/)
      end
    end

    context 'with a new User-Agent header' do
      use_vcr_cassette 'requestbin/user_agent' 

      it 'returns a simple 200 response' do
        code, message, body = Webhook.post(
          'http://requestb.in/yadzsfya', 
          {
            'time' => 'to go'
          }, 
          {
            'User-Agent' => 'VCR/Agent 1.0'
          }
        )

        code.should eq('200')
        message.should eq("OK")
        body.should match(/ok/)
      end
    end
  end
end