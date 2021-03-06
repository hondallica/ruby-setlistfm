require 'spec_helper'

RSpec.describe Setlistfm do
  let(:api_key) { 'your_api_key' }

  context 'Request' do
    it 'has a HTTP client' do
      setlistfm = Setlistfm.new(api_key)
      expect(setlistfm.http.class).to eq Faraday::Connection
    end

    it 'has a x-api-key header' do
      setlistfm = Setlistfm.new(api_key)
      expect(setlistfm.http.headers['x-api-key']).to be_truthy
    end

    it 'has a User-Agent' do
      setlistfm = Setlistfm.new(api_key)
      expect(setlistfm.http.headers['User-Agent']).to eq "ruby-setlistfm/#{setlistfm.version}"
    end

    it 'has an Accept header ' do
      setlistfm = Setlistfm.new(api_key)
      expect(setlistfm.http.headers['Accept']).to eq 'application/json'
    end
  end
end
