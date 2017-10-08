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

  context 'city' do
    let(:url) { "https://api.setlist.fm/rest/1.0/city/#{geoid}" }
    let(:geoid) { '5357527' }
    let(:fixture) { 'spec/fixtures/city/geoid.json' }

    it 'request was successful' do
      setlistfm = Setlistfm.new('your_api_key')
      res = setlistfm.city(geoid)
      expect(res.status).to eq 200
      expect(res.body.name).to eq 'Hollywood'
    end
  end
end
