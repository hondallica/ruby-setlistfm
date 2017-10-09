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
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/search/cities\?*| }

  context 'search_cityies' do
    let(:fixture) { 'spec/fixtures/search/cities/200.json' }
    it 'country' do
      res = setlistfm.search_cities({country: 'US'})
      expect(res.status).to eq 200
      expect(res.body.page).to eq 1
    end

    it 'name' do
      res = setlistfm.search_cities({name: 'Loomis'})
      expect(res.status).to eq 200
      expect(res.body.page).to eq 1
    end

    it 'p' do
      res = setlistfm.search_cities({country: 'US', p: 1})
      expect(res.status).to eq 200
      expect(res.body.page).to eq 1
    end

    it 'state' do
      res = setlistfm.search_cities({state: 'California'})
      expect(res.status).to eq 200
      expect(res.body.page).to eq 1
    end

    it 'stateCode' do
      res = setlistfm.search_cities({stateCode: 'CA'})
      expect(res.status).to eq 200
      expect(res.body.page).to eq 1
    end
  end
end
