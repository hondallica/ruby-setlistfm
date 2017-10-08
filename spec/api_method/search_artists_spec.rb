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
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/search/artists\?*| }
  let(:mbid) { '27e2997f-f7a1-4353-bcc4-57b9274fa9a4' }

  context 'search_artists' do
    let(:fixture) { 'spec/fixtures/search/artists/200.json' }

    it 'artistMbid' do
      res = setlistfm.search_artists({artistMbid: mbid})
      expect(res.status).to eq 200
      expect(res.body.artist[0].name).to eq 'BABYMETAL'
    end

    it 'artistName' do
      res = setlistfm.search_artists({artistName: 'METAL'})
      expect(res.status).to eq 200
    end

    it 'artistTmid' do
      res = setlistfm.search_artists({artistTmid: 735610})
      expect(res.status).to eq 200
    end
    
    it 'pagenation' do
      res = setlistfm.search_artists({ artistName: 'METAL', p: 2 })
      expect(res.status).to eq 200
    end

    it 'sorting relevance' do
      res = setlistfm.search_artists({ artistName: 'METAL', p: 2, sort: 'relevance'})
      expect(res.status).to eq 200
    end
  end
end
