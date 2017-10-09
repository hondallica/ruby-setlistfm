require 'spec_helper'

RSpec.describe Setlistfm do
  before do
    WebMock.stub_request(:get, url).to_return(
      body: File.read(fixture),
      status: 200,
      headers: { 'Content-Type' => 'application/json' }
    )
  end
  
  let(:setlistfm) { Setlistfm.new('your_api_key') }
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/venue/.+/setlists\?*| }

  context 'venue_setlists' do
    let(:fixture) { 'spec/fixtures/venue/setlists/200.json' }
    it 'venue_setlists' do
      res = setlistfm.venue_setlists('6bd6ca6e')
      expect(res.status).to eq 200
    end
  end
end
