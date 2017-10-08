require 'spec_helper'
require 'webmock/rspec'

RSpec.describe Setlistfm do
  before do
    WebMock.enable!
  end

  context 'Method' do
    context 'artist' do
      let(:mbid) { '27e2997f-f7a1-4353-bcc4-57b9274fa9a4' }

      before do
        WebMock.stub_request(:get, "https://api.setlist.fm/rest/1.0/artist/#{mbid}").to_return(
          body: File.read('spec/fixtures/artist/200.json'),
          status: 200,
          headers: { 'Content-Type' =>  'application/json' })
      end

      after do
        WebMock.disable!
      end

      it 'request was successful' do
        setlistfm = Setlistfm.new('your_api_key')
        res = setlistfm.artist(mbid)
        expect(res.status).to eq 200
        expect(res.body.name).to eq 'BABYMETAL'
      end
    end

    context 'artist/setlist' do
      let(:mbid) { '27e2997f-f7a1-4353-bcc4-57b9274fa9a4' }

      it 'request was successful' do
        WebMock.stub_request(:get, "https://api.setlist.fm/rest/1.0/artist/#{mbid}/setlists").to_return(
          body: File.read('spec/fixtures/artist/setlists/200_page1.json'),
          status: 200,
          headers: { 'Content-Type' =>  'application/json' })

        setlistfm = Setlistfm.new('your_api_key')
        res = setlistfm.artist_setlists(mbid)
        expect(res.status).to eq 200
        expect(res.body.page).to eq 1
      end

      it 'pagenation' do
        WebMock.stub_request(:get, "https://api.setlist.fm/rest/1.0/artist/#{mbid}/setlists?p=2").to_return(
          body: File.read('spec/fixtures/artist/setlists/200_page2.json'),
          status: 200,
          headers: { 'Content-Type' =>  'application/json' })

        setlistfm = Setlistfm.new('your_api_key')
        res = setlistfm.artist_setlists(mbid, { p: 2 })
        expect(res.status).to eq 200
        expect(res.body.page).to eq 2
      end
    end
  end
end
