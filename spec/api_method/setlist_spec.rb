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
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/setlist/.+\?*| }

  context 'setlist' do
    let(:fixture) { 'spec/fixtures/setlist/200.json' }
    it 'setlist' do
      res = setlistfm.setlist('6bd6ca6e')
      expect(res.status).to eq 200
    end
  end
end
