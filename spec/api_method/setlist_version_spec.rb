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
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/setlist/version/.+\?*| }

  context 'setlist_version' do
    let(:fixture) { 'spec/fixtures/search/venues/200.json' }
    it 'setlist_version' do
      res = setlistfm.setlist_version('6bd6ca6e')
      expect(res.status).to eq 200
    end
  end
end
