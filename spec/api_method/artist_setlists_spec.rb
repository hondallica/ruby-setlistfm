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

  let(:mbid) { '27e2997f-f7a1-4353-bcc4-57b9274fa9a4' }

  context 'artist/setlist' do
    let(:url) { "https://api.setlist.fm/rest/1.0/artist/#{mbid}/setlists" }
    let(:fixture) { 'spec/fixtures/artist/setlists/200_page1.json' }

    it 'request was successful' do
      setlistfm = Setlistfm.new('your_api_key')
      res = setlistfm.artist_setlists(mbid)
      expect(res.status).to eq 200
      expect(res.body.page).to eq 1
    end
  end

  context 'artist/setlist' do
    let(:url) { "https://api.setlist.fm/rest/1.0/artist/#{mbid}/setlists?p=2" }
    let(:fixture) { 'spec/fixtures/artist/setlists/200_page2.json' }

    it 'pagenation' do
      setlistfm = Setlistfm.new('your_api_key')
      res = setlistfm.artist_setlists(mbid, p: 2)
      expect(res.status).to eq 200
      expect(res.body.page).to eq 2
    end
  end
end
