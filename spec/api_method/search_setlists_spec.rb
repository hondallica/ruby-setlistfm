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
  let(:setlistfm) { Setlistfm.new(api_key) }
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/search/setlists\?*| }
  let(:mbid) { '27e2997f-f7a1-4353-bcc4-57b9274fa9a4' }

  context 'search_setlists' do
    let(:fixture) { 'spec/fixtures/search/setlists/200.json' }

    it 'artistMbid' do
      res = setlistfm.search_setlists({artistMbid: mbid})
      expect(res.status).to eq 200
    end
  end
end
