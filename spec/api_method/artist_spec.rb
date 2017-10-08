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

  context 'artist' do
    let(:url) { "https://api.setlist.fm/rest/1.0/artist/#{mbid}" }
    let(:mbid) { '27e2997f-f7a1-4353-bcc4-57b9274fa9a4' }
    let(:fixture) { 'spec/fixtures/artist/200.json' }

    it 'request was successful' do
      setlistfm = Setlistfm.new('your_api_key')
      res = setlistfm.artist(mbid)
      expect(res.status).to eq 200
      expect(res.body.name).to eq 'BABYMETAL'
    end
  end
end
