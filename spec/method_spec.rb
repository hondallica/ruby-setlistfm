require 'spec_helper'
require 'webmock/rspec'

RSpec.describe Setlistfm do
  before do
    WebMock.enable!
  end

  context 'Method' do
    context 'Artist' do
      let(:mbid) { '27e2997f-f7a1-4353-bcc4-57b9274fa9a4' }

      before do
        WebMock.stub_request(:get, "https://api.setlist.fm/rest/1.0/artist/#{mbid}").to_return(
          body: File.read('spec/fixtures/artist/200.json'),
          status: 200,
          headers: { 'Content-Type' =>  'application/json' })
      end

      it 'request was successful' do
        setlistfm = Setlistfm.new('your_api_key')
        res = setlistfm.artist(mbid)
        expect(res.status).to eq 200
        expect(res.body.name).to eq 'BABYMETAL'
      end
    end
  end
end
