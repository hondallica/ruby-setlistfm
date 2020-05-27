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
  let(:url) { %r|https://api\.setlist\.fm/rest/1\.0/user/.+/attended\?*| }

  context 'user_attended' do
    let(:fixture) { 'spec/fixtures/user/attended/200.json' }
    it 'user_attended' do
      res = setlistfm.user_attended('Savonarolla')
      expect(res.status).to eq 200
    end
  end
end
