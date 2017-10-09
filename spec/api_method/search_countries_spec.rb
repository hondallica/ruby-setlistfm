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
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/search/countries\?*| }

  context 'search_countries' do
    let(:fixture) { 'spec/fixtures/search/countries/200.json' }
    it 'countries' do
      res = setlistfm.search_countries
      expect(res.status).to eq 200
      expect(res.body.page).to eq 1
    end
  end
end
