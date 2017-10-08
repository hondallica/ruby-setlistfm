require 'spec_helper'

RSpec.describe Setlistfm do
  context 'Request' do
    it 'has a HTTP client' do
      setlistfm = Setlistfm.new('your_api_key')
      expect(setlistfm.http.class).to eq Faraday::Connection
    end

    it 'has a x-api-key header' do
      setlistfm = Setlistfm.new('your_api_key')
      expect(setlistfm.http.headers['x-api-key']).to be_truthy
    end

    it 'has a User-Agent' do
      setlistfm = Setlistfm.new('your_api_key')
      expect(setlistfm.http.headers['User-Agent']).to eq 'ruby-setlistfm'
    end

    it 'has an Accept header ' do
      setlistfm = Setlistfm.new('your_api_key')
      expect(setlistfm.http.headers['Accept']).to eq 'application/json'
    end
  end
end
