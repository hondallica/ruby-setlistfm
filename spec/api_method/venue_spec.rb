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
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/venue/.+\?*| }

  context 'venue' do
    let(:fixture) { 'spec/fixtures/venue/200.json' }
    it 'venue' do
      res = setlistfm.venue('6bd6ca6e')
      puts res.body.to_json
      expect(res.status).to eq 200
    end
  end
end