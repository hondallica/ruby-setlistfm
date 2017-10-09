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
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/user/.+\?*| }

  context 'user' do
    let(:fixture) { 'spec/fixtures/user/200.json' }
    it 'user' do
      res = setlistfm.user('hondallica')
      expect(res.status).to eq 200
    end
  end
end
