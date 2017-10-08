require 'spec_helper'

RSpec.describe Setlistfm do
  context 'version' do
    it 'has a version' do
      setlistfm = Setlistfm.new('your_api_key')
      expect(setlistfm.version).to be_truthy
    end

    it 'has an api_version' do
      setlistfm = Setlistfm.new('your_api_key')
      expect(setlistfm.api_version).to eq '1.0'
    end

    it 'change an api_version' do
      setlistfm = Setlistfm.new('your_api_key')
      setlistfm.api_version = '1.1'
      expect(setlistfm.api_version).to eq '1.1'
    end
  end

  context 'API Key' do
    it 'set an API key from argument' do
      api_key = 'your_api_key'
      setlistfm = Setlistfm.new(api_key)
      expect(setlistfm.api_key).to eq 'your_api_key'
    end

    it "set an API key from ENV['SETLISTFM_API_KEY']" do
      ENV['SETLISTFM_API_KEY'] = 'ENV_API_KEY'
      setlistfm = Setlistfm.new
      expect(setlistfm.api_key).to eq 'ENV_API_KEY'
    end

    it "not set ENV['SETLISTFM_API_KEY']" do
      ENV.reject! { |k| k == 'SETLISTFM_API_KEY' }
      expect { Setlistfm.new }.to raise_error(RuntimeError)
    end

    it 'change an API key' do
      api_key = 'your_api_key'
      setlistfm = Setlistfm.new(api_key)
      setlistfm.api_key = 'update_api_key'
      expect(setlistfm.api_key).to eq 'update_api_key'
    end
  end

  context 'API URL' do
    it 'get an API url' do
      setlistfm = Setlistfm.new('your_api_key')
      expect(setlistfm.url).to eq 'https://api.setlist.fm'
    end
    it 'change an API url' do
      setlistfm = Setlistfm.new('your_api_key')
      setlistfm.url = 'https://example.com'
      expect(setlistfm.url).to eq 'https://example.com'
    end
  end
end
