require 'spec_helper'

RSpec.describe Setlistfm do
  before do
    WebMock.enable!
    WebMock.stub_request(:get, url).to_return(
      body: File.read(fixture),
      status: 200,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  after do
    WebMock.disable!
  end

  let(:api_key) { 'your_api_key' }

  context 'city' do
    let(:url) { "https://api.setlist.fm/rest/1.0/city/#{geoid}" }
    let(:geoid) { '1850147' }
    let(:fixture) { 'spec/fixtures/city/geoid.json' }

    it 'request was successful' do
      setlistfm = Setlistfm.new(api_key)
      res = setlistfm.city(geoid)
      expect(res.status).to eq 200
      expect(res.body.name).to eq 'Tokyo'
    end
  end
end
